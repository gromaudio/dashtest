/*
 * utils for libavcodec
 * Copyright (c) 2001 Fabrice Bellard.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/**
 * @file utils.c
 * utils.
 */

#include "ff_inttypes.h"
#include "avcodec.h"
#include "dsputil.h"
#include "mpegvideo.h"

#define FF_COLOR_RGB      0 /* RGB color space */
#define FF_COLOR_GRAY     1 /* gray color space */
#define FF_COLOR_YUV      2 /* YUV color space. 16 <= Y <= 235, 16 <= U, V <= 240 */
#define FF_COLOR_YUV_JPEG 3 /* YUV color space. 0 <= Y <= 255, 0 <= U, V <= 255 */

#define FF_PIXEL_PLANAR   0 /* each channel has one component in AVPicture */
#define FF_PIXEL_PACKED   1 /* only one components containing all the channels */
#define FF_PIXEL_PALETTE  2  /* one components containing indexes for a palette */

typedef struct PixFmtInfo {
    const char *name;
    uint8_t nb_channels;     /* number of channels (including alpha) */
    uint8_t color_type;      /* color type (see FF_COLOR_xxx constants) */
    uint8_t pixel_type;      /* pixel storage type (see FF_PIXEL_xxx constants) */
    uint8_t is_alpha : 1;    /* true if alpha can be specified */
    uint8_t x_chroma_shift;  /* X chroma subsampling factor is 2 ^ shift */
    uint8_t y_chroma_shift;  /* Y chroma subsampling factor is 2 ^ shift */
    uint8_t depth;           /* bit depth of the color components */
} PixFmtInfo;


/* this table gives more information about formats */
static PixFmtInfo pix_fmt_info[PIX_FMT_NB]= {
		{ "yuv420p", 3, FF_COLOR_YUV, FF_PIXEL_PLANAR, 0, 1, 1, 8 },
		{ "yuv422p", 3, FF_COLOR_YUV, FF_PIXEL_PLANAR, 0, 1, 1, 8 },
    { "rgb24", 3, FF_COLOR_RGB, FF_PIXEL_PACKED, 0, 0, 0, 8 },
    { "bgr24", 3, FF_COLOR_RGB, FF_PIXEL_PACKED, 0, 0, 0, 8 },
    { "yuvj422p", 3, FF_COLOR_YUV_JPEG, FF_PIXEL_PLANAR, 0, 1, 0, 8 },
    { "yuvj444p", 3, FF_COLOR_YUV_JPEG, FF_PIXEL_PLANAR, 0, 0, 0, 8 },
    { "rgba32", 4, FF_COLOR_RGB, FF_PIXEL_PACKED, 1,0, 0, 8 },
    { "yuv410p", 3, FF_COLOR_YUV, FF_PIXEL_PLANAR, 0, 2, 2, 8 },
    { "yuv411p", 3, FF_COLOR_YUV, FF_PIXEL_PLANAR, 0, 2, 0, 8 },
		{ "rgb565", 3, FF_COLOR_RGB, FF_PIXEL_PACKED, 0, 0, 0, 5 },
		{ "rgb555", 4, FF_COLOR_RGB, FF_PIXEL_PACKED, 1, 0, 0, 5 },
		{ "gray", 1, FF_COLOR_GRAY,FF_PIXEL_PLANAR, 0, 0, 0, 8 },
		{ "monow", 1, FF_COLOR_GRAY, FF_PIXEL_PLANAR, 0, 0, 0, 1 },
    { "monob", 1, FF_COLOR_GRAY, FF_PIXEL_PLANAR, 0, 0, 0, 1 },
		{ "pal8", 4, FF_COLOR_RGB, FF_PIXEL_PALETTE, 1, 0, 0, 8 },
		{ "yuvj420p", 3, FF_COLOR_YUV_JPEG, FF_PIXEL_PLANAR, 0, 1, 1, 8 },
		{ "yuv422", 1, FF_COLOR_YUV, FF_PIXEL_PACKED, 0, 1, 0, 8 },
		{ NULL, 0, 0, 0, 0, 0, 0, 0 },
		{ NULL, 0, 0, 0, 0, 0, 0, 0 }
};


/* allocation of static arrays - do not use for normal allocation */
static unsigned int last_static = 0;
static char*** array_static = NULL;
static const unsigned int grow_static = 64; // ^2
/* encoder management */
AVCodec *first_avcodec;

void register_avcodec(AVCodec *format)
{
    AVCodec **p;
    p = &first_avcodec;
    while (*p != NULL) p = &(*p)->next;
    *p = format;
    format->next = NULL;
}

typedef struct InternalBuffer{
    int last_pic_num;
    uint8_t *base[4];
    uint8_t *data[4];
		int ref;
		AVFrame *pic;
}InternalBuffer;

#ifndef _STATIC

void avcodec_get_chroma_sub_sample(int pix_fmt, int *h_shift, int *v_shift)
{
    *h_shift = pix_fmt_info[pix_fmt].x_chroma_shift;
    *v_shift = pix_fmt_info[pix_fmt].y_chroma_shift;
}

char *av_strdup(const char *s)
{
    char *ptr;
    int len;
    len = strlen(s) + 1;
    ptr = av_malloc(len);
    if (!ptr)
        return NULL;
    memcpy(ptr, s, len);
    return ptr;
}

int avcodec_default_get_buffer(AVCodecContext *s, AVFrame *pic){
    int i;
    const int width = s->width;
    const int height= s->height;
    InternalBuffer *buf;

    assert(pic->data[0]==NULL);
    assert(INTERNAL_BUFFER_SIZE > s->internal_buffer_count);

    if(s->internal_buffer==NULL){
        s->internal_buffer= av_mallocz(INTERNAL_BUFFER_SIZE*sizeof(InternalBuffer));
    }
#if 0
    s->internal_buffer= av_fast_realloc(
        s->internal_buffer,
        &s->internal_buffer_size,
        sizeof(InternalBuffer)*FFMAX(99,  s->internal_buffer_count+1)/*FIXME*/
        );
#endif
		if( s->internal_buffer_count== INTERNAL_BUFFER_SIZE )
		{
			fprintf( stderr, "get_buffer(): maximum number %d of buffers reached\n", s->internal_buffer_count );
			return -1;
		}

    buf= &((InternalBuffer*)s->internal_buffer)[s->internal_buffer_count];

    if(buf->base[0]){
        pic->age= pic->coded_picture_number - buf->last_pic_num;
        buf->last_pic_num= pic->coded_picture_number;
    }else{
        int align, h_chroma_shift, v_chroma_shift;
        int w, h, pixel_size;

        avcodec_get_chroma_sub_sample(s->pix_fmt, &h_chroma_shift, &v_chroma_shift);
        switch(s->pix_fmt){
        case PIX_FMT_RGB555:
        case PIX_FMT_RGB565:
        case PIX_FMT_YUV422:
            pixel_size=2;
            break;
        case PIX_FMT_RGB24:
        case PIX_FMT_BGR24:
            pixel_size=3;
            break;
        case PIX_FMT_RGBA32:
            pixel_size=4;
            break;
        default:
            pixel_size=1;
        }

        if(s->codec_id==CODEC_ID_SVQ1) align=63;
        else                           align=15;

        w= (width +align)&~align;
        h= (height+align)&~align;

        if(!(s->flags&CODEC_FLAG_EMU_EDGE)){
            w+= EDGE_WIDTH*2;
            h+= EDGE_WIDTH*2;
        }

        buf->last_pic_num= -256*256*256*64;

        for(i=0; i<3; i++){
            const int h_shift= i==0 ? 0 : h_chroma_shift;
            const int v_shift= i==0 ? 0 : v_chroma_shift;

            pic->linesize[i]= pixel_size*w>>h_shift;

            buf->base[i]= av_mallocz((pic->linesize[i]*h>>v_shift)+16); //FIXME 16
            if(buf->base[i]==NULL) return -1;
            memset(buf->base[i], 128, pic->linesize[i]*h>>v_shift);

            if(s->flags&CODEC_FLAG_EMU_EDGE)
                buf->data[i] = buf->base[i];
            else
                buf->data[i] = buf->base[i] + (pic->linesize[i]*EDGE_WIDTH>>v_shift) + (EDGE_WIDTH>>h_shift);
        }
        pic->age= 256*256*256*64;
        pic->type= FF_BUFFER_TYPE_INTERNAL;
    }

    for(i=0; i<4; i++){
        pic->base[i]= buf->base[i];
        pic->data[i]= buf->data[i];
    }
    s->internal_buffer_count++;
//printf( "inc buffs %d\n", s->internal_buffer_count );
		buf->pic= pic;

    return 0;
}

//-----------------------------------------------------------------------------------
// Added by BORS
// Need to be able to lock the buffer regardless the pictures stored in CodecContext
void avcodec_default_incref_buffer(AVCodecContext *s, void* p ){
	InternalBuffer *buf;
	int i;
  for(i=0; i<s->internal_buffer_count; i++){ //just 3-5 checks so is not worth to optimize
      buf= &((InternalBuffer*)s->internal_buffer)[i];
      if(buf->data[0] == p)
			{
				buf->ref++;
				break;
			}
  }
}

void avcodec_default_decref_buffer(AVCodecContext *s, void *p ){
  InternalBuffer *buf= NULL, *last, temp;
	int i;
  for(i=0; i<s->internal_buffer_count; i++){ //just 3-5 checks so is not worth to optimize
      buf= &((InternalBuffer*)s->internal_buffer)[i];
      if(buf->data[0] == p)
			{
				buf->ref--;
				break;
			}
  }
//printf( ">>dec ref %d %p\n", buf->ref, buf->pic );
	if( buf && !buf->ref && !buf->pic )
	{
		assert(i < s->internal_buffer_count);
		s->internal_buffer_count--;
//printf( "dec buffs1 %d\n", s->internal_buffer_count );
		last = &((InternalBuffer*)s->internal_buffer)[s->internal_buffer_count];

		temp= *buf;
		*buf= *last;
		*last= temp;
	}
}
//-----------------------------------------------------------------------------------

void avcodec_default_release_buffer(AVCodecContext *s, AVFrame *pic){
    int i;
    InternalBuffer *buf, *last, temp;

    assert(pic->type==FF_BUFFER_TYPE_INTERNAL);
    assert(s->internal_buffer_count);

    for(i=0; i<s->internal_buffer_count; i++){ //just 3-5 checks so is not worth to optimize
        buf= &((InternalBuffer*)s->internal_buffer)[i];
        if(buf->data[0] == pic->data[0])
            break;
    }
		// Added by BORS
		// Make sure referenced frames are not released
//printf( ">>dec rel %d\n", buf->ref );
		if( !buf->ref )
		{
			assert(i < s->internal_buffer_count);
			s->internal_buffer_count--;
//printf( "dec buffs %d\n", s->internal_buffer_count );
			last = &((InternalBuffer*)s->internal_buffer)[s->internal_buffer_count];

			temp= *buf;
			*buf= *last;
			*last= temp;
		}
		else
			buf->pic= NULL;

    for(i=0; i<3; i++){
        pic->data[i]=NULL;
//        pic->base[i]=NULL;
    }
//printf("R%X\n", pic->opaque);
}

enum PixelFormat avcodec_default_get_format(struct AVCodecContext *s, enum PixelFormat * fmt){
    return fmt[0];
}

void avcodec_get_context_defaults(AVCodecContext *s){
    s->bit_rate= 800*1000;
    s->bit_rate_tolerance= s->bit_rate*10;
    s->qmin= 2;
    s->qmax= 31;
    s->mb_qmin= 2;
    s->mb_qmax= 31;
    s->rc_eq= "tex^qComp";
    s->qcompress= 0.5;
    s->max_qdiff= 3;
    s->b_quant_factor=1.25;
    s->b_quant_offset=1.25;
    s->i_quant_factor=-0.8;
    s->i_quant_offset=0.0;
    s->error_concealment= 3;
    s->error_resilience= 1;
    s->workaround_bugs= FF_BUG_AUTODETECT;
    s->frame_rate_base= 1;
    s->frame_rate = 25;
    s->gop_size= 50;
    s->me_method= ME_EPZS;
    s->get_buffer= avcodec_default_get_buffer;
    s->release_buffer= avcodec_default_release_buffer;
    s->get_format= avcodec_default_get_format;
    s->me_subpel_quality=8;

    s->intra_quant_bias= FF_DEFAULT_QUANT_BIAS;
    s->inter_quant_bias= FF_DEFAULT_QUANT_BIAS;
}

#endif /* _STATIC */

/**
 * allocates a AVCodecContext and set it to defaults.
 * this can be deallocated by simply calling free()
 */
AVCodecContext *avcodec_alloc_context(void){
    AVCodecContext *avctx= av_mallocz(sizeof(AVCodecContext));

    if(avctx==NULL) return NULL;

    avcodec_get_context_defaults(avctx);

    return avctx;
}

/**
 * allocates a AVPFrame and set it to defaults.
 * this can be deallocated by simply calling free()
 */
AVFrame *avcodec_alloc_frame(void){
    AVFrame *pic= av_mallocz(sizeof(AVFrame));

    return pic;
}

int avcodec_open(AVCodecContext *avctx, AVCodec *codec)
{
    int ret;

    avctx->codec = codec;
    avctx->codec_id = codec->id;
    avctx->frame_number = 0;
    if (codec->priv_data_size > 0) {
        avctx->priv_data = av_mallocz(codec->priv_data_size);
        if (!avctx->priv_data)
            return -ENOMEM;
    } else {
        avctx->priv_data = NULL;
    }
    ret = avctx->codec->init(avctx);
    if (ret < 0) {
        av_freep(&avctx->priv_data);
        return ret;
    }
    return 0;
}

int avcodec_encode_audio(AVCodecContext *avctx, uint8_t *buf, int buf_size,
                         const short *samples)
{
    int ret;

    ret = avctx->codec->encode(avctx, buf, buf_size, (void *)samples);
    avctx->frame_number++;
    return ret;
}

int avcodec_encode_video(AVCodecContext *avctx, uint8_t *buf, int buf_size,
                         const AVFrame *pict)
{
    int ret;

    ret = avctx->codec->encode(avctx, buf, buf_size, (void *)pict);

    emms_c(); //needed to avoid a emms_c() call before every return;

    avctx->frame_number++;
    return ret;
}

/**
 * decode a frame.
 * @param buf bitstream buffer, must be FF_INPUT_BUFFER_PADDING_SIZE larger then the actual read bytes
 * because some optimized bitstream readers read 32 or 64 bit at once and could read over the end
 * @param buf_size the size of the buffer in bytes
 * @param got_picture_ptr zero if no frame could be decompressed, Otherwise, it is non zero
 * @return -1 if error, otherwise return the number of
 * bytes used.
 */
int avcodec_decode_video(AVCodecContext *avctx, AVFrame *picture,
                         int *got_picture_ptr,
                         uint8_t *buf, int buf_size)
{
    int ret;

    ret = avctx->codec->decode(avctx, picture, got_picture_ptr,
                               buf, buf_size);

    emms_c(); //needed to avoid a emms_c() call before every return;

    if (*got_picture_ptr)
        avctx->frame_number++;
    return ret;
}

/* decode an audio frame. return -1 if error, otherwise return the
   *number of bytes used. If no frame could be decompressed,
   *frame_size_ptr is zero. Otherwise, it is the decompressed frame
   *size in BYTES. */
int avcodec_decode_audio(AVCodecContext *avctx, int16_t *samples,
                         int *frame_size_ptr,
                         uint8_t *buf, int buf_size)
{
    int ret;

    ret = avctx->codec->decode(avctx, samples, frame_size_ptr,
                               buf, buf_size);
    avctx->frame_number++;
    return ret;
}

int avcodec_close(AVCodecContext *avctx)
{
    if (avctx->codec->close)
        avctx->codec->close(avctx);
    av_freep(&avctx->priv_data);
    avctx->codec = NULL;
    return 0;
}

AVCodec *avcodec_find_encoder(enum CodecID id)
{
    AVCodec *p;
    p = first_avcodec;
    while (p) {
        if (p->encode != NULL && p->id == id)
            return p;
        p = p->next;
    }
    return NULL;
}

AVCodec *avcodec_find_encoder_by_name(const char *name)
{
    AVCodec *p;
    p = first_avcodec;
    while (p) {
        if (p->encode != NULL && strcmp(name,p->name) == 0)
            return p;
        p = p->next;
    }
    return NULL;
}

AVCodec *avcodec_find_decoder(enum CodecID id)
{
    AVCodec *p;
    p = first_avcodec;
    while (p) {
        if (p->decode != NULL && p->id == id)
            return p;
        p = p->next;
    }
    return NULL;
}

AVCodec *avcodec_find_decoder_by_name(const char *name)
{
    AVCodec *p;
    p = first_avcodec;
    while (p) {
        if (p->decode != NULL && strcmp(name,p->name) == 0)
            return p;
        p = p->next;
    }
    return NULL;
}

AVCodec *avcodec_find(enum CodecID id)
{
    AVCodec *p;
    p = first_avcodec;
    while (p) {
        if (p->id == id)
            return p;
        p = p->next;
    }
    return NULL;
}

void avcodec_string(char *buf, int buf_size, AVCodecContext *enc, int encode)
{
    const char *codec_name;
    AVCodec *p;
    char buf1[32];
    char channels_str[100];
    int bitrate;

    if (encode)
        p = avcodec_find_encoder(enc->codec_id);
    else
        p = avcodec_find_decoder(enc->codec_id);

    if (p) {
        codec_name = p->name;
    } else if (enc->codec_name[0] != '\0') {
        codec_name = enc->codec_name;
    } else {
        /* output avi tags */
        if (enc->codec_type == CODEC_TYPE_VIDEO) {
            snprintf(buf1, sizeof(buf1), "%c%c%c%c",
                     enc->codec_tag & 0xff,
                     (enc->codec_tag >> 8) & 0xff,
                     (enc->codec_tag >> 16) & 0xff,
                     (enc->codec_tag >> 24) & 0xff);
        } else {
            snprintf(buf1, sizeof(buf1), "0x%04x", enc->codec_tag);
        }
        codec_name = buf1;
    }

    switch(enc->codec_type) {
    case CODEC_TYPE_VIDEO:
        snprintf(buf, buf_size,
                 "Video: %s%s",
                 codec_name, enc->mb_decision ? " (hq)" : "");
        if (enc->codec_id == CODEC_ID_RAWVIDEO) {
            snprintf(buf + strlen(buf), buf_size - strlen(buf),
                     ", %s", "raw"
                     /*avcodec_get_pix_fmt_name(enc->pix_fmt)*/);
        }
        if (enc->width) {
            snprintf(buf + strlen(buf), buf_size - strlen(buf),
                     ", %dx%d, %0.2f fps",
                     enc->width, enc->height,
                     (float)enc->frame_rate / enc->frame_rate_base);
        }
        if (encode) {
            snprintf(buf + strlen(buf), buf_size - strlen(buf),
                     ", q=%d-%d", enc->qmin, enc->qmax);
        }
        bitrate = enc->bit_rate;
        break;
    case CODEC_TYPE_AUDIO:
        snprintf(buf, buf_size,
                 "Audio: %s",
                 codec_name);
        switch (enc->channels) {
            case 1:
                strcpy(channels_str, "mono");
                break;
            case 2:
                strcpy(channels_str, "stereo");
                break;
            case 6:
                strcpy(channels_str, "5:1");
                break;
            default:
                sprintf(channels_str, "%d channels", enc->channels);
                break;
        }
        if (enc->sample_rate) {
            snprintf(buf + strlen(buf), buf_size - strlen(buf),
                     ", %d Hz, %s",
                     enc->sample_rate,
                     channels_str);
        }

        /* for PCM codecs, compute bitrate directly */
        switch(enc->codec_id) {
        case CODEC_ID_PCM_S16LE:
        case CODEC_ID_PCM_S16BE:
        case CODEC_ID_PCM_U16LE:
        case CODEC_ID_PCM_U16BE:
            bitrate = enc->sample_rate * enc->channels * 16;
            break;
        case CODEC_ID_PCM_S8:
        case CODEC_ID_PCM_U8:
        case CODEC_ID_PCM_ALAW:
        case CODEC_ID_PCM_MULAW:
            bitrate = enc->sample_rate * enc->channels * 8;
            break;
        default:
            bitrate = enc->bit_rate;
            break;
        }
        break;
    default:
        av_abort();
    }
    if (encode) {
        if (enc->flags & CODEC_FLAG_PASS1)
            snprintf(buf + strlen(buf), buf_size - strlen(buf),
                     ", pass 1");
        if (enc->flags & CODEC_FLAG_PASS2)
            snprintf(buf + strlen(buf), buf_size - strlen(buf),
                     ", pass 2");
    }
    if (bitrate != 0) {
        snprintf(buf + strlen(buf), buf_size - strlen(buf),
                 ", %d kb/s", bitrate / 1000);
    }
}

unsigned avcodec_version( void )
{
  return LIBAVCODEC_VERSION_INT;
}

unsigned avcodec_build( void )
{
  return LIBAVCODEC_BUILD;
}

/* must be called before any other functions */
void avcodec_init(void)
{
    static int inited = 0;

    if (inited != 0)
	return;
    inited = 1;

    dsputil_static_init();
}

/**
 * Flush buffers, should be called when seeking or when swicthing to a different stream.
 */
void avcodec_flush_buffers(AVCodecContext *avctx)
{
    if(avctx->codec->flush)
        avctx->codec->flush(avctx);
}

void avcodec_default_free_buffers(AVCodecContext *s){
    int i, j;

    if(s->internal_buffer==NULL) return;

    for(i=0; i<INTERNAL_BUFFER_SIZE; i++){
        InternalBuffer *buf= &((InternalBuffer*)s->internal_buffer)[i];
        for(j=0; j<4; j++){
            av_freep(&buf->base[j]);
            buf->data[j]= NULL;
        }
    }
    av_freep(&s->internal_buffer);

    s->internal_buffer_count=0;
}

char av_get_pict_type_char(int pict_type){
    switch(pict_type){
    case I_TYPE: return 'I';
    case P_TYPE: return 'P';
    case B_TYPE: return 'B';
    case S_TYPE: return 'S';
    case SI_TYPE:return 'i';
    case SP_TYPE:return 'p';
    default:     return '?';
    }
}

int av_reduce(int *dst_nom, int *dst_den, int64_t nom, int64_t den, int64_t max){
    int exact=1, sign=0;
    int64_t gcd, larger;

    assert(den != 0);

    if(den < 0){
        den= -den;
        nom= -nom;
    }

    if(nom < 0){
        nom= -nom;
        sign= 1;
    }

    for(;;){ //note is executed 1 or 2 times
        gcd = ff_gcd(nom, den);
        nom /= gcd;
        den /= gcd;

        larger= FFMAX(nom, den);

        if(larger > max){
            int64_t div= (larger + max - 1) / max;
            nom =  (nom + div/2)/div;
            den =  (den + div/2)/div;
            exact=0;
        }else
            break;
    }

    if(sign) nom= -nom;

    *dst_nom = nom;
    *dst_den = den;

    return exact;
}

int64_t av_rescale(int64_t a, int64_t b, int64_t c){
    uint64_t h, l;
    assert(c > 0);
    assert(b >=0);

    if(a<0) return -av_rescale(-a, b, c);

    h= a>>32;
    if(h==0) return a*b/c;

    l= a&0xFFFFFFFF;
    l *= b;
    h *= b;

    l += (h%c)<<32;

    return ((h/c)<<32) + l/c;
}

/* Picture field are filled with 'ptr' addresses */
int avpicture_fill(AVPicture *picture, UINT8 *ptr,
                    int pix_fmt, int width, int height)
{
    int size;

    size = width * height;
    switch(pix_fmt) {
    case PIX_FMT_YUV420P:
        picture->data[0] = ptr;
        picture->data[1] = picture->data[0] + size;
        picture->data[2] = picture->data[1] + size / 4;
        picture->linesize[0] = width;
        picture->linesize[1] = width / 2;
        picture->linesize[2] = width / 2;
        break;
    case PIX_FMT_YUV422P:
        picture->data[0] = ptr;
        picture->data[1] = picture->data[0] + size;
        picture->data[2] = picture->data[1] + size / 2;
        picture->linesize[0] = width;
        picture->linesize[1] = width / 2;
        picture->linesize[2] = width / 2;
        break;
    case PIX_FMT_YUV444P:
        picture->data[0] = ptr;
        picture->data[1] = picture->data[0] + size;
        picture->data[2] = picture->data[1] + size;
        picture->linesize[0] = width;
        picture->linesize[1] = width;
        picture->linesize[2] = width;
        break;
    case PIX_FMT_RGB24:
    case PIX_FMT_BGR24:
        picture->data[0] = ptr;
        picture->data[1] = NULL;
        picture->data[2] = NULL;
        picture->linesize[0] = width * 3;
        break;
    case PIX_FMT_RGBA32:
        picture->data[0] = ptr;
        picture->data[1] = NULL;
        picture->data[2] = NULL;
        picture->linesize[0] = width * 4;
        break;
    case PIX_FMT_YUV422:
        picture->data[0] = ptr;
        picture->data[1] = NULL;
        picture->data[2] = NULL;
        picture->linesize[0] = width * 2;
        break;
    default:
        picture->data[0] = NULL;
        picture->data[1] = NULL;
        picture->data[2] = NULL;
        break;
    }
		return 0;
}

int avpicture_get_size(int pix_fmt, int width, int height)
{
    int size;

    size = width * height;
    switch(pix_fmt) {
    case PIX_FMT_YUV420P:
        size = (size * 3) / 2;
        break;
    case PIX_FMT_YUV422P:
        size = (size * 2);
        break;
    case PIX_FMT_YUV444P:
        size = (size * 3);
        break;
    case PIX_FMT_RGB24:
    case PIX_FMT_BGR24:
        size = (size * 3);
        break;
    case PIX_FMT_RGBA32:
        size = (size * 4);
        break;
    case PIX_FMT_YUV422:
        size = (size * 2);
        break;
    default:
        size = -1;
        break;
    }
    return size;
}