Return-Path: <ksummit+bounces-2639-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 605E4C6BAE8
	for <lists@lfdr.de>; Tue, 18 Nov 2025 22:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 117EC29206
	for <lists@lfdr.de>; Tue, 18 Nov 2025 21:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF5A30BBBD;
	Tue, 18 Nov 2025 21:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="U9nDE8Z8"
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530792F2619
	for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 21:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763499937; cv=none; b=iL/K3PZxwTXsnY36VzT8VMlxD0ioTPIMUZTcMWWQMQIsufzthK+pdJSAsLDHcqQFmKAd0csGiv1P0FnauODOOl1bZZr1M1Crm1ITzgGQSJNxffknc9O6gMZYFmgJ/hyFY9upudgzDBjZT/fTQbYkJugzunw1bJfrGIDuFL026Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763499937; c=relaxed/simple;
	bh=yYqMw42Oz+U+bum9bewLI+l5LnfvlWzOIgjxhCeefdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRjKW0wDzrdZGgRex6HODk56W8f0j8jfS3tsRE9gerVo7PqWY3iYXQaae8ZOyxhhctFmhGvsCilRDAyVvaxPxnhHjiMO/CkPGDMLdldK7TAYY/l+plo9UN2F/m2gnhnt+sKNJ84Wz23obhMlnJo83VS1Yx7ycgKgrPLVOMUAeU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=U9nDE8Z8; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso501394a12.0
        for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 13:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763499933; x=1764104733; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=68+gSioo7Jzhuz0OfbTwCd4q8sAqndpvxxfdttW2vK8=;
        b=U9nDE8Z8YRtBYTk+5wMy0Sezti0VsQHjC8RaCDeqwTcm6f1rUjkliASa49UvIk8P59
         0hjFGCz2rkLYgaivlItI8b2fa18oLD0sJNzt/vcXaPE4Z1zD+hFSJButhd5pSb0cTY/r
         nG16kDSTX8+SW4+URcnyahaeaDoj5EKRxaEKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763499933; x=1764104733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68+gSioo7Jzhuz0OfbTwCd4q8sAqndpvxxfdttW2vK8=;
        b=jFupwqshsqkur+NRkdh3RdQTQcN5LLuMqtcCMp8cNftRmlk+Yxdz7gpU64vKQ7bmSv
         hl9WBW9RD6qh4LQECiu6+/S2yZjunOMPphcPs0EbrwTpNs1RTHI6zEMw9BOXzSfRbNHw
         XEzvqFct1M2/87WqrfTMA3cF8Xj+YGfzPt3dP+iVn73GIW3H6gK+jspupyx/Sm7+v/I2
         RCU+1jTXyAPXi8vK1MZinmfuvdPO8ap7g8A3dIK07hJizlnLp3H6coawyuc1QwTMAqDl
         NTOXJ9EQ4JBMLs1QPGH75m2ItS6mVAGwNRdvhOfhKTz9gawiaWStX4N/VnflfP3Xg9r0
         V6Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVFHG0uMDHBSmbnBS3PTEXddPsRAri+zlHIjV/36Cnl6/iDKLOr0hJEsTnGZ9LutklJb0kJ/RJ8@lists.linux.dev
X-Gm-Message-State: AOJu0YwR4aDyRyypIbxTXnNZIckH/5OCj2t4/yA265uGmo+oy/iC5Lad
	bfimAD/xftvN3A6bYG5OEP/fnnjl9FGEHzfjCEJWm8dF2v2aEdLJvPqPaLzMrtYKg22cl0eDqdJ
	Tj+/JUJ4=
X-Gm-Gg: ASbGncu5wUEo/BrD0Tvta6uvNehvUeFPI9Ksg9cWHEjR0PdUM8068aEvBNXM38aemys
	WqWCjBRIfc6KsDS/5brLpf7OeAbeeliQKijol8R9Py3abqWtU/pT3sM992oWmf1EGpgGrRg9sSm
	xrZnXgr770iirwrhywPsiec/5Zeso9GH+HofawP8cVZfV5HrUfdWeDGNoOGECGjIzjMlJXI9keS
	lTdZOUoabL1notKaQAQrsL3M6yOyU2II21+Kg8V2S1etD0oaHrm6V1rfI+hfS9xIXULG/J83KdN
	5IlgxYbDWjJ8u5d+MoG2gFa+o5sLEfFEZQKNsyZPwK2ESj7enWKPMgXtzT7gQYU0zn8BCFPkacx
	x6zE6UZjgHaB1nsag4wuDsYO+CHhR+fkEuNkrIc5aCJ26RtpTn/CvqabzmVSvYsmC0gSilrNlSO
	pLsDYsBl3Fe1G1HAZ2IDjPPqUgN3a84T3LsqE//9UL6azTGUi9IiwmSVSqEzNP
X-Google-Smtp-Source: AGHT+IHXHkNpBKAzOb3/Q6tfVvlJN7/9+MWr4/ps0byW6DxjgT/TV00h6oyT3d4O6qX1A6hr2JSocQ==
X-Received: by 2002:a05:6402:1d55:b0:645:d07:8924 with SMTP id 4fb4d7f45d1cf-6451f97ea20mr12546a12.16.1763499933185;
        Tue, 18 Nov 2025 13:05:33 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d8775sm13470793a12.5.2025.11.18.13.05.31
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 13:05:31 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso376786a12.1
        for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 13:05:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWlhvPeHgUd4F24VpY7T+PirIwKcTHrNLy2dItO/P3vel9LqGJgw6OYdgoiLatyFHrLGRtRv2As@lists.linux.dev
X-Received: by 2002:a17:907:7ea2:b0:afe:159:14b1 with SMTP id
 a640c23a62f3a-b7638d37abamr2624566b.9.1763499931191; Tue, 18 Nov 2025
 13:05:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org> <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
 <20251118141720.11c8d4d6@gandalf.local.home> <CAHk-=whPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztCdgPWP1WA@mail.gmail.com>
 <20251118145618.7dd829f1@gandalf.local.home> <CAHk-=whQ9kzJWFrCY9C3bPkdfW5Zb0TdvKNdPCdzPSnrzHyhVw@mail.gmail.com>
In-Reply-To: <CAHk-=whQ9kzJWFrCY9C3bPkdfW5Zb0TdvKNdPCdzPSnrzHyhVw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Nov 2025 13:05:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjMMSAaqTjBSfYenfuzE1bMjLj+2DLtLWJuGt07UGCH_Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmOVgUGlWaohOMdz2PRQom7cM-bfEHRX7okZHsroBl_fnatEc6tGJ_3erM
Message-ID: <CAHk-=wjMMSAaqTjBSfYenfuzE1bMjLj+2DLtLWJuGt07UGCH_Q@mail.gmail.com>
Subject: Re: Clarifying confusion of our variable placement rules caused by cleanup.h
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Bart Van Assche <bvanassche@acm.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 12:23, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Now, I think that your crazy case that wants to do alignment etc may
> never be a good example of this, but for the simpler case of "I just
> want a normal allocation for this" a couple of helper macros would
> make it quite nice.

Actually, if we made some "kmalloc_type()" helper macro also do
__alignof__ in addition to the sizeef() , and _if_ the type itself
already has the proper alignment information, it probably would work
fine for most cases.

Your particular example is still too specialized, though, with that
whole "I want a particular node" and a "I want the dynamic cacheline
alignment" rather than "current node" and "static alignment based on
type".

So I think *that* particular case is always specialized enough that
there won't be some simple helper macro to make it more readable, and
as a result you're actually better off just splitting it out, even if
it then results in some duplication, ie just doing

        struct ring_buffer_per_cpu *cpu_buffer __free(kfree);

        cpu_buffer = kzalloc_node(...);

as separate things (but probably next to each other, so that the
"__free(kfree)" part makes sense because the allocation is right
there).

But hey, you could also just make your own alloc/free wrapper
functions, and try to make it more legible that way.

Just a simple

    struct ring_buffer_per_cpu *cpu_buffer_alloc()
    { return kzalloc_node(...); }

would then make that otherwise nasty allocation then become just

    auto cpu_buffer __free(kfree) = cpu_buffer_alloc();

and suddenly it all looks pretty simple. No?

But please do _not_ spread one complex thing over three lines. Split
it up *somehow* to make it easier to read.

Either by just splitting it up into multiple parts, or maybe like the
above with a helper wrapper allocator or whatever.

Helper wrappers that are just used once or twice can still be nice
readability improvements just because they make each part be easier to
read on its own.

              Linus

