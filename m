Return-Path: <ksummit+bounces-1775-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFBEA3E8AC
	for <lists@lfdr.de>; Fri, 21 Feb 2025 00:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B80F119C3534
	for <lists@lfdr.de>; Thu, 20 Feb 2025 23:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98E4267737;
	Thu, 20 Feb 2025 23:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVDJrgUB"
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE07265633
	for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 23:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740094872; cv=none; b=OXrOJXZf3xKO0Yd/XhW6xGhu0LPdnLVPMHroBCb3iH0HlS5FQwc/FzbZZ+gorU6BoI1yKJDkJYACxq9tXR7SL2C+itB9CAYyeeP2hLM0CqWMM2RgsLqZfcucuBkk1HRNMFsWOIr9C5KGg6DdTwXX56v/1ota4hUj1U2FSWjrCt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740094872; c=relaxed/simple;
	bh=irbzh/oe51A79xVYF3jxZzKe+dVGiUXNJMFjUvq6beY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZF8QlyZfkzMOwdR5p26lotGLBxkFG9fl/BlYfaWUhfLhosbhEioASwcQ6cpLxpnPCAFDsYOUCujKeamjT6F/fMoZpGlRxPCRtFIMwZgWEjHofuY6eT7gAiAjz9E0CcIt00raAufFrcgnxaNY8FX1ihW4At22pzspu3lR6dwMUpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVDJrgUB; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fc95e20e72so365827a91.1
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 15:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740094870; x=1740699670; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irbzh/oe51A79xVYF3jxZzKe+dVGiUXNJMFjUvq6beY=;
        b=OVDJrgUBKWVI1VRqT/2OAEPDwYgWZpkHiRb4Hiw7kYB7Gaj0yS29haNoUkt+pFfbtD
         tCugjCilT4k9XHy6hPL5sjwvjk3PNq09v/hYphPWLoy2FoB7gRRPjJHSuZ0NUKojORel
         mQx+CXoZsUuMVzBBrNLOH4SPHiqONEfK8rx6rqWzV3D27QEuyE8A4HzjC+ZmZA0HUp1n
         nRQFnJLkzBu6sKNXvhpNrmAywY8Bdhk2rdAiyG8c30uMR3mNuHZuU+pDLeaWGOulOupN
         rl6Jmy895TLYrzGrtm/hl3Ubmoltky9Kov0+VHgTVvjVvGsc+ZbQYrh6Wk4gWXttwbcd
         wK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740094870; x=1740699670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irbzh/oe51A79xVYF3jxZzKe+dVGiUXNJMFjUvq6beY=;
        b=j6/Ekyu7lk3m17HFjBLlflhsHiP5NxnRV6Cu+5WxQlcS0H3ll3JJsr+zkl1o7HtWDW
         F8huOZYQnxckC8l4Gvh9I5xyIXOKaj9US1bHmAr2yyHZkB57sUOTkXGMGyHFuSOUjB5R
         ZJ+MmIte4q9H0tdlXdzTfV06xrwqus2aRtozcEYQxDS01rxaJnDUGGd2AWlnjbMAW2F2
         7+9GHvm24lye6MitLzsCT6ZiwkixNOhi0SA+N+L5dTHY7Yq73jcobwss3V5+p2Qg8038
         uCIIl9XyR4clxWIGiR3QJfY1XG8Pr099Ydt5D28wCzu9khY36LFg5fq+LGwOvUBMFokw
         QlPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh1+AGdx+qlUeyzQ6pDJGGVXVzWv+fphuqHW+CrpfgNnAEo+C1K/eJLilWpu/D2rwj+iVKYLvi@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+hEG8waSHL309QLd6G7B9/kFtQOSU2CcDPpnWFgr61MSiuLL5
	lNEEW0mf2AfTbv0kpMlOF84T2LuB2c12Hg8LO9IUbms+3m21TaS/ThcdedqGmNolbHNi5dubx14
	/kpZCpNks10SG6YITM5IlqZR8MP0=
X-Gm-Gg: ASbGncvnIX6P0N/GqVwa7intW9Qo+YSY04TcOivNNnA5fyCy4QPHSJkyPOmWA3+Skvp
	jkHNHu77kMgZfZSj0E9r9/wvAku0eKRldbXxjfOkxFzCqqzEqGkflcaKTa6tMDli6j8RhpsQz
X-Google-Smtp-Source: AGHT+IE3tTMC50ciOK+8N/4de26wZ6Pg8vooUK40uWXc0KvimGcWwvs1xaU2vMuCSIhfeBeWHEofydflMa9Ma5wDnkg=
X-Received: by 2002:a17:90b:1e05:b0:2fa:17d2:158 with SMTP id
 98e67ed59e1d1-2fce75dfdb1mr694090a91.0.1740094870138; Thu, 20 Feb 2025
 15:41:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z7SwcnUzjZYfuJ4-@infradead.org> <b0a8ee53b767b7684de91eeb6924ecdf5929d31e.camel@HansenPartnership.com>
 <CANiq72nnnOsGZDrPDm8iWxYn2FL=wJqx-P8aS63dFYez3_FEOg@mail.gmail.com>
 <a627845f73f2f7bedc7a820cfdf476be9993e30f.camel@HansenPartnership.com>
 <CANiq72m5KB-X1zck1E43yffXOTeD4xRmZgDx_oUiNwR941ce0w@mail.gmail.com> <20250219170623.GB1789203@mit.edu>
In-Reply-To: <20250219170623.GB1789203@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Feb 2025 00:40:57 +0100
X-Gm-Features: AWEUYZmuZcjvGrCyDvmTbEKuMO6tYd_p5yChnLfIZmwrF8AsdfajLNX5ZuOK-5U
Message-ID: <CANiq72=O+sz0mU-urYmviCm55GL0jWzsbjAJviJpT+3MLmQSCA@mail.gmail.com>
Subject: Re: Rust kernel policy
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 6:06=E2=80=AFPM Theodore Ts'o <tytso@mit.edu> wrote=
:
>
> I do understand (now) what Wedson was trying to do, was to show off
> how expressive and powerful Rust can be, even in the face of a fairly
> complex interface.

Thanks for saying that.

> It turns out there were some good reasons for why
> the VFS handles inode creation, but in general, I'd encourage us to
> consider whether there are ways to change the abstractions on the C
> side so that:

Definitely -- improving the C side (not just for Rust callers, but
also for C ones) would be great, whether that is with extra
annotations/extensions or redesigns.

In the beginning (pre-merge), we tried hard not to require changes on
the C side, because we wanted to show that it is possible to use Rust
(i.e. create safe abstractions for C APIs) even with minimal or no
changes to C headers. We thought it was a useful property.

But then we got C maintainers that welcomed improvements that would
benefit both sides, which was nice to see, and opens up some doors --
as a simple example, Greg added made some APIs `const`-correct so that
we got the right pointer type on the Rust bindings.

So, yeah, anything in that direction (that either improves the C side
and/or simplifies the Rust bindings/abstractions) would be great.

Cheers,
Miguel

