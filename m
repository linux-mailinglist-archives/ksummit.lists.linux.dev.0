Return-Path: <ksummit+bounces-2229-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 951FAB37581
	for <lists@lfdr.de>; Wed, 27 Aug 2025 01:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9E337A569A
	for <lists@lfdr.de>; Tue, 26 Aug 2025 23:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5FD305E21;
	Tue, 26 Aug 2025 23:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="WdO5eJ7H"
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4E127F728
	for <ksummit@lists.linux.dev>; Tue, 26 Aug 2025 23:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756250736; cv=none; b=Zl4WhjjheivtkDEhFJf3AapeAGyBuPAmxPMD2J7Bj9HT5jxpavpvhGCFSJ3qgZMHaQY1L/ti2woKGj6sjtgKMvEsx1wFkR408UUnCA3Fp/HuCOLMi9I6osbQipAQ1pZ/y8Y6KZ4Gevsv7s+u3hRbUWaH1DRbhV9F/JQurifgstI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756250736; c=relaxed/simple;
	bh=+3h1OV7oR2RGZR9f29qS9kx57PEazWNuvNMXX5rv7dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Segn2IB7mY03Y+v6w9+46ioTcz7ZTnOfl36W5oA8YhQ2sHK9In7YQUN6mePaiYXsCUUmbwNwx3sijTHiK6/yXWpZFSeaajSgKTEdYy1Vnz95qCOSfBVAqD7ErQcZhm5VpDEtTta7qo90faQagHzyPy+q2l2DCOPZEuw8lnrOARQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=WdO5eJ7H; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NzrWAKiaGsMu7yjVJaylaSgsCv6ti08sKq6hUA8FT4c=; b=WdO5eJ7Hs0wa8fNUN46RkIeJTD
	YHXaxjvocWQBeLiDtatSDv0c6ywObBngEesBvZu00MFGb391pknDDXobSxnBOmZ4Nv7CRBL2Tlwit
	5I0zO77uVzItvV/XkosgJ3fqeFh0p07WmMv77OPu2dz3QgKOuNbj3oNBVJAYByOFHRnbZBTUG7RKK
	2f4h0m37boiJXB3nJy5Zci77c5Hha3x6WcjhXodnYaWGlLR9i+rX9ilJMyDGyhFhi03eHNexiDRTu
	/XttVIdG1yjMvXCIJT18rD+PjPwQGOarSzQ93WotX8RgZKFSDvZXsqNYXb4jPBYRiqIZzeqnNqbjH
	744Duo6w==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur32h-00000009I33-3MBZ;
	Tue, 26 Aug 2025 23:25:31 +0000
Date: Wed, 27 Aug 2025 00:25:31 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
Message-ID: <20250826232531.GX39973@ZenIV>
References: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
 <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com>
 <536or9s2-r219-2854-2n7s-q299s7q7noq9@xreary.bet>
 <CAHk-=wi2E0BBX1ZUEo5B5a0E+M_eFU_NgWgp+cABfsqR9f-cAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi2E0BBX1ZUEo5B5a0E+M_eFU_NgWgp+cABfsqR9f-cAQ@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Aug 26, 2025 at 03:44:13PM -0700, Linus Torvalds wrote:

> If you can't automate a good 1:1 conversion that is clearly a no-op,
> maybe your new API is just complete garbage.
> 
> Honestly, if a new API is not a 100% obvious proper superset of the
> old one, WTF are you doing?
> 
> IOW, if you are creating a new API that doesn't express the EXACT SAME
> behavior as the old API did as one part of it, I think your new API is
> likely complete and utter shite.

Depends... An example of a bad API: dma_buf_fd().  It grabs a descriptor and
attaches an opened file associated with dmabuf to it;  lifetime of dmabuf
is that of the file in question, so the reference is consumed on success
and left to caller on failure.  Users (and that's after fixing a bunch of
broken ones during the last couple of cycles):

dma_heap_buffer_alloc():
	...
        fd = dma_buf_fd(dmabuf, fd_flags);
        if (fd < 0) {
                dma_buf_put(dmabuf);
                /* just return, as put will call release and that will free */
        }
        return fd;

udmabuf_create():
	...
        ret = dma_buf_fd(dmabuf, flags);
        if (ret < 0)
                dma_buf_put(dmabuf);

kfd_ioctl_export_dmabuf():
	...
        ret = dma_buf_fd(dmabuf, args->flags);
        if (ret < 0) {
                dma_buf_put(dmabuf);
                goto err_out;
        }
	...

intel_vgpu_get_dmabuf():
	...
        ret = dma_buf_fd(dmabuf, DRM_CLOEXEC | DRM_RDWR);
        if (ret < 0) {
                gvt_vgpu_err("create dma-buf fd failed ret:%d\n", ret);
                goto out_free_dmabuf;
        }
	...
out_free_dmabuf:
        dma_buf_put(dmabuf);

ttm_prime_handle_to_fd():
        ret = dma_buf_fd(dma_buf, flags);
        if (ret >= 0) {
                *prime_fd = ret;
                ret = 0;
        } else
                dma_buf_put(dma_buf);

vb2_core_expbuf():
        ret = dma_buf_fd(dbuf, flags & ~O_ACCMODE);
        if (ret < 0) {
                dprintk(q, 3, "buffer %d, plane %d failed to export (%d)\n",
                        vb->index, plane, ret);
                dma_buf_put(dbuf);
                return ret;
        }

fastrpc_dmabuf_alloc():
        bp.fd = dma_buf_fd(buf->dmabuf, O_ACCMODE);
        if (bp.fd < 0) {
                dma_buf_put(buf->dmabuf);
                return -EINVAL;
        }

... and in samples/video-mdev/mbochs.c:mbochs_get_gfx_dmabuf()
	...
        return dma_buf_fd(dmabuf->buf, 0);

Which leaks on failure, and samples/* is not a good place for that,
since it invites copying the leak back into drivers.

IMO that thing has wrong calling conventions.  I have not done anything
besides fixing the obvious bugs in users (and leaks were not even close
to the worst problems - try to access dmabuf after _success_ and you
get a UAF since another thread can guess the descriptor and close(2)
it) since I'm not involved in any of the areas where it's used, and when
asking opinions re changing the calling conventions got zero reaction...
*shrug*

I still think that saner replacement should consume the reference passed
to it both on success and on failure.  Theoretically, you can express
the original through that (bump refcount of file associated with dmabuf,
call that "saner replacement", then do dma_buf_put() only in case
of success), but at that point I'd say that original API is shite and
simulating it is just plain wrong.  _If_ we go for eliminating it,
that is - another approach is to grep through the tree once in a while
and watch out of new bugs cropping up in the callers.  Up to the
folks maintaining that area, really...

A similar thing around fs/* would have all in-tree users replaced, with
description placed in Documentation/filesystems/porting.rst ("recommended:
if you are using sucky_API(), see if you have run afoul of such and such
scenario.  Convert to replacement_API() in such and such way", basically)
and either taken out immediately (with s/recommended/mandatory/) or left
alone for a cycle or two, then ripped out.

