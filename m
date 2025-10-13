Return-Path: <ksummit+bounces-2514-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CE9BD6671
	for <lists@lfdr.de>; Mon, 13 Oct 2025 23:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 38C2E350E82
	for <lists@lfdr.de>; Mon, 13 Oct 2025 21:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6362FA0F6;
	Mon, 13 Oct 2025 21:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JwIIYDt2"
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864AB2FA0DD
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 21:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760392013; cv=none; b=dpmVZJUmqTRg5KLqtDM0DC8QN63GWRN2G5gC/C6awKMID6OsvdNZFOav5v3rC2NW1PbJXso/k7AlyLjBGYKuER8R3zM7lHXxPFQ89vhCrjloK4byJUQbvbdDlo23kf4Q5iZII8uTxVRwwCnnANYSPNNMEiJxYMXHO5RFsuaCVYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760392013; c=relaxed/simple;
	bh=aLp3hG0aw4cgF+mqSlUSNZmh/qi5bctmxNA2Efg+3iI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjWydKDnJhRVqGCUYLWxMl50k+lqakz6DINf/5KzagzU17zFfCrI3CKq0T35i0sOdgt81LBZeTv7ICG6fCDtFipHT0M9RI+gwLbpJ39zzRTquFLzYeWoUA6s9XO7z44YLSGm+9sPsiiKx6bg7vkf7by//yxLk5V5VzmF4BSzA/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JwIIYDt2; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7841da939deso4028176b3a.2
        for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 14:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760392006; x=1760996806; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLp3hG0aw4cgF+mqSlUSNZmh/qi5bctmxNA2Efg+3iI=;
        b=JwIIYDt2d/JsO3rKoHr6f0uYNTqQWneo2dTU2nrDaRT6hjJrmlpGeP0uoY8NvXk4i2
         wGgYTpJfwSXp7hvIQJDZvXfM+QR4oOhgof4+mXCDA6DUVUZatS9/Z/oYi1Z52ZBCJnrH
         1okNozTl3tK8jtkX71jkG5W15r9dHz+UnT6pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392006; x=1760996806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLp3hG0aw4cgF+mqSlUSNZmh/qi5bctmxNA2Efg+3iI=;
        b=jzw1sHn7Px3A3NVUyANWiQ3AUQ9ibAM97LYsdconCoO4KLsGXvoaxrYno76Kkh6FBs
         4B1DE5WFOtE6+7G+LKcL43nDDbPnUmBa/g7HqpOvdGoPtnFyCyVtYPgxz2vFBPcr/MHS
         /JHSAbRrJm+Sh1RtoE45UYYnsLmq7wQOrbH8QD2AwMUJm7OSL1XCasBrZyPjq71O3gwT
         LElcMf4XbbjfU1e+9hKag0uFfhH84oCVbpOVynrNYR1ubelU/naqGmAC4lrpIXLxEXOe
         L/nabH4YqzunCCi0tHPVV/FFlzW80OnsMByJlxz+toXyJJNDeGwXdwILIXSyKB3d87Gg
         w6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQIPl/ezqc9Ai5gJRCnVywv5+3EL9/R73Yn/dCFV3cuLxPCg3RQ66MWTjSdAPStdZbyHVC5u3J@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0FQ7PQC4hQ1jf9c4YqvbVldnFu+CGHeP4GEZSvWMTwiiJMA89
	zprgYnSyl8dqzfX0u+zCE5oH23FKTqk5wGMMXI9+nS0S3YtWtQS1fEjZ39cWjRSvF/GWBASbWB6
	3/wA=
X-Gm-Gg: ASbGncuUGy8oaeVYibrTQdcZxrusIbsINhqYcK1swbGw8rTYKSAcEIAfhCBrpgK7IKs
	a3LFNWE0XcT6yubRhvepqFd7YC9mzFEvhtVsTID/rhnVKiupzpydl0Fa/qmurWGv4Nc7gjcNWu+
	H6xMB9y1Wg837KDyMOVWqdWe69qxr97gVEKpOq7/tL5eSOm8wevpQKRz5330XK4cNVscaOPKoUA
	rHKo1lYB9Vag66jWhz7ZmRqJnIq0wUHSW11Miu+bktpomuaP+oUvAeG1SNsCbQtaqfiRWSWPbcC
	urXt2tHm4xc6TYEnt34Akh0flI6e+Ejiy6Xh4YBH7xDWqKabpD+/k204ECs+ukiXCrMe4wB4/RZ
	DRbpcDL84FKbNrh9qSGLptNmQXZTMQBpMHZ+QpKdstxwmNBa4YcwsBKImEm/XXIIPdNTjRSUpl3
	0Y8+Bu80LP3wJ/DpDqbCk=
X-Google-Smtp-Source: AGHT+IHyS8nZ82Jjzs6QDQVWF5WyzOpC7/nKXVbXU1U5RYwpLp0hoL6/1wEDVTFywqWtZBg4jzKN8Q==
X-Received: by 2002:a05:6a20:7488:b0:32b:71e9:81ae with SMTP id adf61e73a8af0-32da8134622mr31880794637.8.1760392005966;
        Mon, 13 Oct 2025 14:46:45 -0700 (PDT)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com. [209.85.214.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df6a95esm9923761a12.36.2025.10.13.14.46.44
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 14:46:44 -0700 (PDT)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-26c209802c0so45135545ad.0
        for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 14:46:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVm/yXyHaOVQNQUy/mz6M6kfgEbuEdoc5V8w5ikIuQw12rOOsoic9FtGZB9i1jryEtyR0T/aflb@lists.linux.dev
X-Received: by 2002:a17:903:40cc:b0:26e:d0aa:7690 with SMTP id
 d9443c01a7336-29027402c79mr251547725ad.41.1760392003778; Mon, 13 Oct 2025
 14:46:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <c86ba3c682251154ec554f39004c392f8b8e1c02.camel@HansenPartnership.com>
 <20251013133913.015f253b@gandalf.local.home> <20251013175031.GJ354523@mit.edu>
 <7EE2713D-7612-4EAC-9E4E-225A92FEC9D3@zytor.com> <CAHk-=wj8mfMkkLFXdMLyAzUPRH-m1h=+uJrJFSxQSRuRxbi-iw@mail.gmail.com>
 <CAD=FV=UjA8+pZoXMh9WgCHZAUX=pd7ehWxuu9kTFr5Dp5O-rCQ@mail.gmail.com> <18e3d34e-6608-403e-8b85-4873858e9788@suse.cz>
In-Reply-To: <18e3d34e-6608-403e-8b85-4873858e9788@suse.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Oct 2025 14:46:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VuJitvt2m-uthmRJYo6JJNTdU5WHXxbZG6-AY0LbfxnA@mail.gmail.com>
X-Gm-Features: AS18NWAMTaX6iGUFx21LzuFLGcREfmLHmTh22ejttGBXwqbA5_nnv4xvEeBYqe4
Message-ID: <CAD=FV=VuJitvt2m-uthmRJYo6JJNTdU5WHXxbZG6-AY0LbfxnA@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Steven Rostedt <rostedt@goodmis.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 13, 2025 at 1:59=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> >> All the other arguments seem just disingenuous in that they literally
> >> give less useful information than "b4 dig" does.
> >
> > Wow, I hadn't heard of "b4 dig" and it doesn't appear to have landed
> > yet. ...but I searched and it was easy to find a reference. I'll check
> > it out. Oh, it's using AI. I guess my suggestion that we should use AI
> > to solve this problem was more on point than I realized. ;-) ;-) ;-)
> >
> > OK, I found Sasha's RFC [1].
>
> You found the wrong one. See this one:
>
> https://lore.kernel.org/all/20251010-muscular-camel-of-acumen-00eeaf@lemu=
r/
>
> But if your point was to demonstrate how searching for a subject can lead=
 to
> the wrong outcome, good job :)

Crap, that's funny. Yeah, all the top Google searches for "b4 dig" are
all for Sasha's tool. Konstantin's patch, while landed, isn't in the
most recent "versioned" b4 release (v0.14.3), so I didn't see it.
...and yes, it does somewhat prove the point that just trying to match
on "subject" can be dangerous. I've run into the issue where lore
pages don't seem to be consistently findable in Google in the past and
I guess it struck again...

OK, so Konstantin's version at least solves my problem of getting a
mailing list post from a commit hash, which is good. It uses "git
patch-id" which is a really great/exact solution when it works. It
won't always work, of course. Sometimes maintainers/committers find
merge conflicts when we try to apply and, if folks are feeling
generous and it's easy, folks won't request a re-send. That messes up
patch-id.

Luckily "b4 dig" falls back to subject matching. As per above, that's
not always perfect but probably works more than 95% of the time?

So I guess given the correct pointer to "b4 dig", it seems like a
pretty workable solution for me. It will fail/be wrong sometimes, but
probably less often than I had to deal with a maintainer that didn't
put "Link:" tags in the past. I could still wish that maintainers
could still put "Link:" tags to really document where they obtained
the patch from, but oh well, one can't have everything.

-Doug

