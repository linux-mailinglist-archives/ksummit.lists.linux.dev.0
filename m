Return-Path: <ksummit+bounces-1554-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 894D4950286
	for <lists@lfdr.de>; Tue, 13 Aug 2024 12:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45455283592
	for <lists@lfdr.de>; Tue, 13 Aug 2024 10:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDE819308A;
	Tue, 13 Aug 2024 10:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1SheCTw"
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB8576025
	for <ksummit@lists.linux.dev>; Tue, 13 Aug 2024 10:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723545261; cv=none; b=DpSghT+/+7EylRfe6GQZ2MToiEaxENr7fXwRH1EXFR1f1v7vIFDuQSxS89RKbzonDIZ0o9MGZgcov9bNbe/rh9V8OfhetJXuwH2x6YBc6qS2zrKUa5Uv73VCZv82IPr/jo9SCtrwGWfYEjSPdpTk5EEOTw4Ee0EF/HmOQueOBJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723545261; c=relaxed/simple;
	bh=fzXoe1isBjct/QtD2OM5E7SMpJeuXFjqSDl3SsBrgaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQXSoniujqZNxvlTqX3rR4uYWwd9rlyPbUreLCo4aWImk8vxdefW4+xanyBurpzkPg7f5H+a/alAv6t3ygensMsVUK/75l60t7KK89mD9NJjkTtRpauEM+vrNIINOvirtJdvwH8HimPHd0SEU9Ef/e1NYsEJBdog5TmsrdKgIJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1SheCTw; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ef248ab2aeso82951871fa.0
        for <ksummit@lists.linux.dev>; Tue, 13 Aug 2024 03:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723545258; x=1724150058; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzXoe1isBjct/QtD2OM5E7SMpJeuXFjqSDl3SsBrgaE=;
        b=R1SheCTwWnHSsPu3ISZXkdgiB/2rRriNpBIUcq+yM6eFXrs0RGd8q26q8r0lODv4On
         R8gjLQIsA79JXsf2myGnB93h39/WlzRDXurV6VRz0+LlCJNLfzzDD1jDGXlvDuwpoIkI
         XwTW0f0cWggJ95Z3PnNL4b6P9yeN315XQp1govMNB/WCxbAArOdE3DUP0nkzXxpriMv+
         kVxdCQnmOGZm6H9mmX3AunsO/KKUqurSXO5ufSpDL/J+XhcaDlt2XygNCC36+3ifof6j
         CHPLqBsrPl0mNX5iuNxsuxbvde0TNoh3oelrfGqRrIHuHSRPamrq2cn35hHftr4sGtRu
         VNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723545258; x=1724150058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzXoe1isBjct/QtD2OM5E7SMpJeuXFjqSDl3SsBrgaE=;
        b=ceyVbTwydKO5/7+0SSDPpwKW3Tho4zbiysHGjpKwUg9HbbP1lgEJsUAUm76UJA0ReG
         DBpSAAkJFIV8WAO6SgvGb2WBYwv3lxvq7R2VRaB6hrgApemsOk/4dBVDk4y9NSsHgyaI
         WkJavsmfY0pU+ws67/zCbeo6JSbPWKLZqlehzsKpQaGMckAX2gPgaefX7w9x7HyoX0dG
         VYJGvV3ZZsAxe4+M4gKk3jvQiQsD/LWOV0071++G/czSBGGohkdYeDBJ4zTIihc3fPRH
         eWWPlbln1XJ/9/HhJSdz3Tt85ybT1e57rKUNHlx/QBN27/uCw932vt+/Ztxii9VWTxnB
         V53g==
X-Forwarded-Encrypted: i=1; AJvYcCXu6wHBmtNEeP3NkVDLbd9KBGnWJg5H68j3VSstnBLoZNNvNj09MeXJYx/AyJ1yjSv5BE8fD3nQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ4dCoOwWt0g0YoObVa3BmdJzb6cRA4mLD7chFUgm5R9/9XyjS
	DyQws4G8kDvkmCkyPe94jxBz/mxgIkrD4F8bXsdxf9Gdk/+GjlXuhhFRBzxSa3CSSinQYkbuW4u
	/3YOECb2ncxHJOJpbSRjJy90dc4KDWw==
X-Google-Smtp-Source: AGHT+IFQf6uBkibY15otBoNAQq1YHezfZ8+u3cXNIwNpeGJbOjExMfCzxCYaXKDYewH7buD8RCrm5VcdY8XNGaXhT2I=
X-Received: by 2002:a05:651c:1991:b0:2f1:922f:8751 with SMTP id
 38308e7fff4ca-2f2b70d3584mr30397801fa.0.1723545257786; Tue, 13 Aug 2024
 03:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPybu_1SiMmegv=4dys+1tzV6=PumKxfB5p12ST4zasCjwzS9g@mail.gmail.com>
 <20240725200142.GF14252@pendragon.ideasonboard.com> <CAPybu_1hZfAqp2uFttgYgRxm_tYzJJr-U3aoD1WKCWQsHThSLw@mail.gmail.com>
 <20240726105936.GC28621@pendragon.ideasonboard.com> <CAPybu_1y7K940ndLZmy+QdfkJ_D9=F9nTPpp=-j9HYpg4AuqqA@mail.gmail.com>
 <20240728171800.GJ30973@pendragon.ideasonboard.com> <CAPybu_3M9GYNrDiqH1pXEvgzz4Wz_a672MCkNGoiLy9+e67WQw@mail.gmail.com>
 <Zqol_N8qkMI--n-S@valkosipuli.retiisi.eu> <CAKMK7uGx=VjHCo90htuTE6Oi0b8rt_0NrPsfbZwFKA304m7BdA@mail.gmail.com>
 <CA+Ln22E1YXGykjKqVO+tT8d_3-GYSEf-zY0TEHJq3w7HQEhFhA@mail.gmail.com> <20240813102638.GB24634@pendragon.ideasonboard.com>
In-Reply-To: <20240813102638.GB24634@pendragon.ideasonboard.com>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Tue, 13 Aug 2024 19:33:59 +0900
Message-ID: <CA+Ln22EzL7M+BLXS6dFi0n80XXkQu1CuoUad0EtjZ2ZEnNX=Kg@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Dan Williams <dan.j.williams@intel.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, 
	jgg@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2024=E5=B9=B48=E6=9C=8813=E6=97=A5(=E7=81=AB) 19:27 Laurent Pinchart <laure=
nt.pinchart@ideasonboard.com>:
>
> Hi Tomasz,
>
> On Tue, Aug 13, 2024 at 07:17:07PM +0900, Tomasz Figa wrote:
> > 2024=E5=B9=B47=E6=9C=8831=E6=97=A5(=E6=B0=B4) 22:16 Daniel Vetter <dani=
el.vetter@ffwll.ch>:
> > >
> > > On Wed, 31 Jul 2024 at 13:55, Sakari Ailus <sakari.ailus@iki.fi> wrot=
e:
> > > > This is also very different from GPUs or accel devices that are bui=
lt to be
> > > > user-programmable. If I'd compare ISPs to different devices, then t=
he
> > > > closest match would probably be video codecs -- which also use V4L2=
.
> > >
> > > Really just aside, but I figured I should correct this. DRM supports
> > > plenty of video codecs. They're all tied to gpus, but the real reason
> > > really is that the hw has decent command submission support so that
> > > running the entire codec in userspace except the basic memory and
> > > batch execution and synchronization handling in the kernel is a
> > > feasible design.
> >
> > FWIW, V4L2 also has an interface for video decoders that require
> > bitstream processing in software, it's called the V4L2 Stateless
> > Decoder interface [1]. It defines low level data structures that map
> > directly to the particular codec specification, so the kernel
> > interface is generic and the userspace doesn't need to have
> > hardware-specific components. Hardware that consumes command buffers
> > can be supported simply by having the kernel driver fill the command
> > buffers as needed (as opposed to writing the registers directly).
> > On the other hand, DRM also has the fixed function (i.e. V4L2-alike)
> > KMS interface for display controllers, rather than a command buffer
> > passthrough, even though some display controllers actually are driven
> > by command buffers.
> > So arguably it's possible and practical to do both command
> > buffer-based and fixed interfaces for both display controllers and
> > video codecs. Do you happen to know some background behind why one or
> > the other was chosen for each of them in DRM?
> >
> > For how it applies to ISPs, there are both types of ISPs out in the
> > wild, some support command buffers, while some are programmed directly
> > via registers.
>
> Could you provide examples of ISPs that use command buffers ? The
> discussion has remained fairly vague so far, which I think hinders
> progress.
>
> > For the former, I can see some loss of flexibility if
> > the command buffers are hidden behind a fixed function API, because
> > the userspace would only be able to do what the kernel driver supports
> > internally, which could make some use case-specific optimizations very
> > challenging if not impossible.
>
> Let's try to discuss this with specific examples.

AFAIK Intel IPU6 and newer, Qualcomm and MediaTek ISPs use command
buffers natively.

>
> > [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-=
stateless-decoder.html
> >
> > > And actually good, because your kernel wont ever blow
> > > up trying to parse complex media formats because it just doesn't.
>
> --
> Regards,
>
> Laurent Pinchart

