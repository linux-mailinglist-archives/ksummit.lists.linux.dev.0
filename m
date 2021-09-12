Return-Path: <ksummit+bounces-539-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A17E407F9D
	for <lists@lfdr.de>; Sun, 12 Sep 2021 21:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 19BBC3E1092
	for <lists@lfdr.de>; Sun, 12 Sep 2021 19:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7C13FD8;
	Sun, 12 Sep 2021 19:13:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DFC3FC3
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 19:13:19 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id jg16so16145266ejc.1
        for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 12:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RnKo3lCtvR6/P0hDTm/ufYiHwfJxgTpVAbk333jpL10=;
        b=ELnfraDpw57gLekgBUTfUKj/IFauhkoZiFtq0w639YG7pgodArCOJgIpNxkzW5iKuj
         DTpd0OR2ooHgcPGNQN4axJmsI6K42jbccTJIFBSR+H+qzGTHULaM2GSNvGSgJHIQ47TB
         gR6d62pdCxL6t8M57nJkzNrNGQU/1bT+evXaDIVvBOC+orciEpqaA/6I/X2jIovoOvJz
         Rd0hzKu2fiHzUxVhZAJm9kzKNE3NXb5py/N+JF7R/KLG7gvaVkQdstkE4iPhWat9VeYl
         DX8JmrNStw/b5FJAMvXyYzFMZROJ/Chp8d1JChRK+ZAuhzSR7SkV8nrije80GTHASS33
         reIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RnKo3lCtvR6/P0hDTm/ufYiHwfJxgTpVAbk333jpL10=;
        b=obBrWRBbfS7rn6a1erS8IZkCfyL8hIldlCpIMVVTXKncpW6zDNo9sMJyJj2qjaL9KK
         srVxuQJuzr+r/EKVtlzPncgUJ5tgLwsx5ggUjZW2dVxXMpA/UxLm9JLs6uFpUceqOlsx
         jIxhufn+IGM5rZTdZwdygI6s7zpjDqOTUVCKw/QHnCa4cGlKRiRV8j755rMl594L/sOn
         dUAtPb8TNwIm+bB+VP+90VDMWdZ/b7tU8DdtmgOEcXKXeAkFDmwtwlVV9+PJ5bmU4cyv
         4Rj9PIhyTIFJsx7R67XJtFDCpSfVI35Z+JWRmWc52Qps78pI8RdoBRYnsvkHubfqlSTJ
         KzrQ==
X-Gm-Message-State: AOAM531jDxWFthR6x1X4shnqHEOQbGdopON9EEWRJlZiWUwxeweIhd3c
	5kS92Ausogblnz8CBXdvNNDsKmTksBkILwOSGbKtv8+Ia5I=
X-Google-Smtp-Source: ABdhPJzR/0rdhCdfVymGU2haY01ecpPt/q6BODwl7obWbSOAQJQMEWxUVCFShQcCtxmtIVjGEGteWyLsACVzGY2oUYU=
X-Received: by 2002:a17:906:6d55:: with SMTP id a21mr8802539ejt.509.1631473997962;
 Sun, 12 Sep 2021 12:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <877dfop2lx.fsf@meer.lwn.net>
In-Reply-To: <877dfop2lx.fsf@meer.lwn.net>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 13 Sep 2021 05:13:05 +1000
Message-ID: <CAPM=9tx+wAUSuYm+8eyGX2Y7+J5qY9hZHB7JY_XO_TYEQYJk8g@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Jonathan Corbet <corbet@lwn.net>
Cc: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 Sept 2021 at 07:10, Jonathan Corbet <corbet@lwn.net> wrote:
>
> There has been a regular disagreement in recent years about whether
> drivers for accelerators (such as for the Habana Gaudi device) should be
> subject to the same requirements as GPU drivers when it comes to the
> availability of a free implementation of the user-space side.  It flared
> up again recently:
>
>    https://lwn.net/Articles/867168/
>
> Happily, the Habana situation in particular seems to be resolving
> itself:
>
>    https://lwn.net/ml/linux-kernel/CAFCwf119s7iXk+qpwoVPnRtOGcxeuZb3rnihf6NWWoVT-4ODHA@mail.gmail.com/
>
> But even there it is clear that the fundamental question has not yet
> been resolved.
>
> This seems like the sort of question that the maintainer summit exists
> to address.  Specifically, we could discuss:
>
>  - Under which circumstances should the kernel community require the
>    existence of freely licensed user-space code that exercises all
>    functionalities of a proposed kernel driver or feature?
>
>  - Are there internal kernel interfaces, such as DMA-BUF or P2PDMA, that
>    are only available to drivers with a free user-space implementation?
>    Do we need an EXPORT_SYMBOL_USERSPACE_GPL()?
>
>  - What constitutes an acceptable user-space implementation in cases
>    where these restrictions apply?
>
> I suspect that more clarity (and fewer arguments) on these questions
> would be welcome both within and beyond the development community.
>
> Thanks,

Can everyone take a read of:

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

I think in order to clean the signal/noise ratio up in here, some
education effort might help people realise how non-trivial these
things are.

1. These drivers are not one or two ioctls that a few selftests and a
small test app can cover. It's like saying LTP is all we need to
define the uAPI for the kernel and if anyone does something LTP
doesn't cover the app is broken. These systems are generally complex,
multithreaded and multiuser uAPIs, involving command streams recorded
in userspace being submitted to the devices. They interact with memory
management and can cause unfindable deadlocks across the system if
designed incorrectly. Documentation or kselftests aren't going to cut
it here.

2. In my experience we don't build communities by merging everything,
we build them by saying No more and pushing back on companies with
education and cross-vendor cooperation. Responsible kernel maintenance
shouldn't end at the kernel boundaries. If you aren't the person to
help enforce a userspace for a driver you are being asked to merge,
then don't merge it, but try and engage the vendor with the
communities of interest in the kernel who already deal in those areas.

3. The pressures on these companies to merge things into Linux isn't
altruistic or even that they necessarily want to be in the Linux
kernel upstream. They are being told by Red Hat, Facebook, Google or
someone else that they need an upstream driver. They will generally
engage at a minimal level to get past that blockage and then
disengage. Having a clear set of rules (or a place to discuss those
rules, for new subsystems) and a gentle pushback helps develop
communities by unlocking funding within those larger areas. As Laurent
has said this isn't free, but just putting things into the kernel and
not caring about userspace hasn't built any Linux communities in the
accelerator areas.

That said I started writing a cleaned up version of the above document
which is more generic that other subsystems could sign on to. I was
going to engage with a coalition of like-minded maintainers rather
than trying to gain consensus among a herd of cats to see if we can
draw clearer lines in the sand that cross more subsystems so the
experience of drivers/gpu doesn't go unwasted but also isn't just
bypassed by subsystem hunting.

https://cgit.freedesktop.org/~airlied/linux/log/?h=wip-open-source-userspace

Dave.

