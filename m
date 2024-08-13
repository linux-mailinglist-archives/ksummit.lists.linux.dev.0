Return-Path: <ksummit+bounces-1552-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5EF95023F
	for <lists@lfdr.de>; Tue, 13 Aug 2024 12:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 266BA281B51
	for <lists@lfdr.de>; Tue, 13 Aug 2024 10:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035A918A6A3;
	Tue, 13 Aug 2024 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBwpdxCS"
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2AF17C228
	for <ksummit@lists.linux.dev>; Tue, 13 Aug 2024 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723544249; cv=none; b=CLvX2ymASS7Xl3A3NMykVxhmrPNX9sH/UYtcM92/pdkDpp6r0T9K0T2QwCRDwYmGi+VpVC1jA5zOcQgybXbDgYtJZBdn7kLRiDKf8zieyJjZv/WcaXjpficg3ssQ6Kef3M3ibxMTNlaS59JjZlqZI20pB2/i5cEVFqxkolrPrxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723544249; c=relaxed/simple;
	bh=KmX/8SPO59kZCItf8lFjsmaMIQZs6UpEn4Kx0JHZWT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9Nsh6O2DUg9lJ1pAYk/mQggXbpx3XWhd9t0UThIAe4DiJ7DmP47ZF+9bMw1g59lthK8OD9gSYIyl+X3rxis7J+9HsJH1izPWQYp3EBsFRNcZxQj6rembuC+UBya7JLMuXpiZnlDQqpFfLlwCpUFusaDkh4tmeive39Ek3PJMoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBwpdxCS; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso57410061fa.1
        for <ksummit@lists.linux.dev>; Tue, 13 Aug 2024 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723544245; x=1724149045; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmX/8SPO59kZCItf8lFjsmaMIQZs6UpEn4Kx0JHZWT0=;
        b=YBwpdxCSFydbcg3i8J7Pl042l2ULEH9eKEYyHIPHyy4EH9T6x4QmKI2cpVSGa7G3DW
         uzfuoOBHpelV5Rp2ucUq8f6J27w3dj7h4ydyYCbsuoeq9b7/WzlCMOFfo5Wr9ECPlGcW
         Zj25gcVhJaqMJQzqIGR3XMO5FYtHGqnren6zwCI1lXkEzK6dvkQQlh99VvW2Dx9PrkwJ
         O7hUGwlthwIRLaqr4JzEr46aenon4kre7jjOCrpF6fDijujn+6v+jsv0ZB5AeTdOaeVU
         vrnuIXs/0oR+YeH0QGvk8pOMnYcbKFjxElJ3VJ0Z3Bg5IEpCs8erAIJv4+2M+t+kTHnn
         anbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723544245; x=1724149045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmX/8SPO59kZCItf8lFjsmaMIQZs6UpEn4Kx0JHZWT0=;
        b=Buw+M9Jic10rTiCMRbw4n0Y6mvX8GGUC+kvd5cUrMvg9Fk7tVBlP0MpMaMmHygWhx+
         k1MztYlvCPo7KGn6uEmLoG8enIxLrStG8vFojmMqntkr5b+lxGo+m4+yvwN99lGyVaZr
         y4ahgQ/CtGFmV0+DjTbFHY2M86yozaZQRrYQw4v5HPEMGAzISJ1RORk5MtmW/NBn6wb5
         mEHzZ78IhAzkmznEeWvEcyEfV1GqADGDGt5yaYUyp3bbidfHDLatbC6KWd7v9eJse03q
         3HUGmGY8pgxtsQQjz/a5d4k4brXP9KsOZNSCFssn0Qz/jJUcXq7yAralFuMAJYCaNeMl
         4iXw==
X-Forwarded-Encrypted: i=1; AJvYcCXIpjkm/KNZJkqycK87s24aA3pUsEHyEShtJ1Qz0Mbt7z0bDaAaAbcZfUb/FtPJsYpph4GygXAFoA8IimQH/bUpIxBHckHyoQ==
X-Gm-Message-State: AOJu0YzL6qr6l6HIFnxSyuBlTpF2oF0mkCoJkF1mcbAqkNOMR+YDkkaB
	6ovl5DskNf942byTw4GsqyM2RyXbXGUPKkrvDMqNRKrnxS9iza428W+T5qRzwffhNfeYNlwx8L1
	tt0y950sX6c2OTdBoHjAK/WBt/3E=
X-Google-Smtp-Source: AGHT+IFKjzuQaaf7e6bx4QvZ27kpa0HEv9KUIhMC9T4vRSl72ApvXVH6j9YQ6g0WwTQ5j/N7cDwtQbTX3PXfdwV5l1A=
X-Received: by 2002:a2e:be8e:0:b0:2ef:1b93:d2b6 with SMTP id
 38308e7fff4ca-2f2b71482d5mr23578061fa.8.1723544244394; Tue, 13 Aug 2024
 03:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240721192530.GD23783@pendragon.ideasonboard.com>
 <CAPybu_2tUmYtNiSExNGpsxcF=7EO+ZHR8eGammBsg8iFh3B3wg@mail.gmail.com>
 <20240722111834.GC13497@pendragon.ideasonboard.com> <CAPybu_1SiMmegv=4dys+1tzV6=PumKxfB5p12ST4zasCjwzS9g@mail.gmail.com>
 <20240725200142.GF14252@pendragon.ideasonboard.com> <CAPybu_1hZfAqp2uFttgYgRxm_tYzJJr-U3aoD1WKCWQsHThSLw@mail.gmail.com>
 <20240726105936.GC28621@pendragon.ideasonboard.com> <CAPybu_1y7K940ndLZmy+QdfkJ_D9=F9nTPpp=-j9HYpg4AuqqA@mail.gmail.com>
 <20240728171800.GJ30973@pendragon.ideasonboard.com> <CAPybu_3M9GYNrDiqH1pXEvgzz4Wz_a672MCkNGoiLy9+e67WQw@mail.gmail.com>
 <Zqol_N8qkMI--n-S@valkosipuli.retiisi.eu> <CAKMK7uGx=VjHCo90htuTE6Oi0b8rt_0NrPsfbZwFKA304m7BdA@mail.gmail.com>
In-Reply-To: <CAKMK7uGx=VjHCo90htuTE6Oi0b8rt_0NrPsfbZwFKA304m7BdA@mail.gmail.com>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Tue, 13 Aug 2024 19:17:07 +0900
Message-ID: <CA+Ln22E1YXGykjKqVO+tT8d_3-GYSEf-zY0TEHJq3w7HQEhFhA@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, 
	Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dan Williams <dan.j.williams@intel.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, 
	jgg@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2024=E5=B9=B47=E6=9C=8831=E6=97=A5(=E6=B0=B4) 22:16 Daniel Vetter <daniel.v=
etter@ffwll.ch>:
>
> On Wed, 31 Jul 2024 at 13:55, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > This is also very different from GPUs or accel devices that are built t=
o be
> > user-programmable. If I'd compare ISPs to different devices, then the
> > closest match would probably be video codecs -- which also use V4L2.
>
> Really just aside, but I figured I should correct this. DRM supports
> plenty of video codecs. They're all tied to gpus, but the real reason
> really is that the hw has decent command submission support so that
> running the entire codec in userspace except the basic memory and
> batch execution and synchronization handling in the kernel is a
> feasible design.

FWIW, V4L2 also has an interface for video decoders that require
bitstream processing in software, it's called the V4L2 Stateless
Decoder interface [1]. It defines low level data structures that map
directly to the particular codec specification, so the kernel
interface is generic and the userspace doesn't need to have
hardware-specific components. Hardware that consumes command buffers
can be supported simply by having the kernel driver fill the command
buffers as needed (as opposed to writing the registers directly).
On the other hand, DRM also has the fixed function (i.e. V4L2-alike)
KMS interface for display controllers, rather than a command buffer
passthrough, even though some display controllers actually are driven
by command buffers.
So arguably it's possible and practical to do both command
buffer-based and fixed interfaces for both display controllers and
video codecs. Do you happen to know some background behind why one or
the other was chosen for each of them in DRM?

For how it applies to ISPs, there are both types of ISPs out in the
wild, some support command buffers, while some are programmed directly
via registers. For the former, I can see some loss of flexibility if
the command buffers are hidden behind a fixed function API, because
the userspace would only be able to do what the kernel driver supports
internally, which could make some use case-specific optimizations very
challenging if not impossible.

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-stat=
eless-decoder.html

> And actually good, because your kernel wont ever blow
> up trying to parse complex media formats because it just doesn't.
> -Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

