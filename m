Return-Path: <ksummit+bounces-2510-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E89ABBD62C2
	for <lists@lfdr.de>; Mon, 13 Oct 2025 22:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B4B804F8C8C
	for <lists@lfdr.de>; Mon, 13 Oct 2025 20:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DFB030AD0F;
	Mon, 13 Oct 2025 20:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cNe31fLb"
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C1930EF99
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 20:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760387663; cv=none; b=Zv1aHhkWzkSST24yylcSaYq2CZVPUmDbICAukxxg4MwsEt9Oqq40BBlH7GaYXLJKuOEyMjxmqatVF/1lOBDPj2nqoBwB5p8JvvuWmEKfDWPj/lWMHW/t7o0tUpouyu8uDpU4DowTbJJdjEd2WjocoJGXixHB29tOxNvCJYNXIV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760387663; c=relaxed/simple;
	bh=eEJdLp05sYDUL/vuAECRXCBRdGN2ovK90CgY4BZRGYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dljQZKKcvZbbMt/iwpff4KKf9w2uo6MCgAFRBShskucBn49gfFbwlLEov97NEvCqQ3vwxTNvkf95Ne1mvNABg2yJ7cdla3sDeE7C/0TC556/5bTvF0siqdb/gflR+Bz/t8kd6pTHI3E/TEa1/Ycf6OHNjNEtKiVtqmkwd/qsA8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cNe31fLb; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-793021f348fso4173378b3a.1
        for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 13:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760387659; x=1760992459; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEJdLp05sYDUL/vuAECRXCBRdGN2ovK90CgY4BZRGYQ=;
        b=cNe31fLbqRuTDviT1Y0bTA8J8mqEqNJGptQo1hi4PrwRXUuMzT8PeXxyCmbc4raeNV
         pXJgh89K89EvoAQfW0MWL/Qz+X5fPkemAQaAZVqJxzHYEN9mq5P3Of47zso/Kz/hXsoa
         G7r1qNHGxBnmwK1n7riscDEFdeD1qixkt4AfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760387659; x=1760992459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEJdLp05sYDUL/vuAECRXCBRdGN2ovK90CgY4BZRGYQ=;
        b=blpMORMT5KOsA3gPEPZ/Clq0/lKBvoTAGNMhACGhtAdsMFpyYZKxcNo81yy49NKjFa
         DdEx13krlTJZL66Uk0gnFhODx6G44UGKOMmKBk/iimqNGDhpPX1Y09++APDIL0VAdgI2
         BpFPTtnQCQxtjZCrkZQUUtQZc9mfch2zivK7v+VrWcAwGHzBs9Pk3qL3hUK6O0wqM/tF
         zhrUpTtOmQlmJ9NVe9yyhXDS2D4mvK2hPNqEep06assIEz8OK9d1/c0lgS2/4xsS9Snv
         JROn7nT+ObS8BrUgdk/Y/oiDOrsVHT5PgBEXR71N4/40+y0uDaGvsP+ucHDMbSaqctp1
         QjRA==
X-Forwarded-Encrypted: i=1; AJvYcCVwWIn4SJATL0RXRn4UOHNUZjQQLZZEavKi90EQLylOCTpf0Lwfp50QFTonRcjRUtnaN5UT7OAz@lists.linux.dev
X-Gm-Message-State: AOJu0YzBozHB4DEnZuK2GspO0rbWla4mR4wVMsJSXMIJ5eI95zBfuL+T
	QoPZatZbwQBYhreFPeArArVVJD0THLPYtJT7RhlmMt694/C2ZyZZSXQCCeiQwa6aAUN4kGx+7df
	ct54=
X-Gm-Gg: ASbGncvgSJCqIb2wr1bAOLoxrICxnogaFuMemwzXGbNn3Y93QgKUtLvUK+tBMKh27Ce
	SEZXkuwn/gew9q/vXA44ej3PCBffmXSRkWkk0t01WXpOge8RGOEOwjCGFco1YtPjTbkgAznHfqO
	AyfsVplukdj/qsUMjL28ByTI/lLaYfypwrvnxw2TEkAFKgWbpcgl8zryJ9nUwgWXB+VpqTs5i+2
	YoRweU0H9bVNWZiuY+OEGQUQFLhXhpc1QFlbOX8JNk/nnloBkPDOVQK5Z08FgYEdHkaAQBbXmTm
	40cMssODkaY/jpgskBQFGObc9ONGRFm67ekhpq/rNAb677AdCfMDhTyX4H6rXMZvxiUD/UGE8UJ
	p5IReo7+iik/Xzhcmd+jf/SkNqPVf+e+Z9S19Z0Qz/hL5SS16rD29XY62UoEFkWxLYziuGXn+//
	ugqIvXXL5fc4gr5c9edHA=
X-Google-Smtp-Source: AGHT+IHBQcArrzGFQapQ7hZ4ugo7lOa3QZLI4+qUJGdPX2SLm7HzaCsyTalp+bCqka+87Q10iAB6vw==
X-Received: by 2002:a05:6a20:3d8d:b0:319:fc6f:8afb with SMTP id adf61e73a8af0-32da8139323mr25894485637.7.1760387659440;
        Mon, 13 Oct 2025 13:34:19 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626403desm13098354a91.7.2025.10.13.13.34.18
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 13:34:18 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b67ae7e76abso1469144a12.3
        for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 13:34:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWH/13BZEdEPtfOa1ANmvirZlDdu1vrOzjwANu1E1F9Zb9dm6WkF+LePEpcWSvaokAZ3tqtymNO@lists.linux.dev
X-Received: by 2002:a17:903:2a8c:b0:290:78b2:675 with SMTP id
 d9443c01a7336-29078b20b87mr9628855ad.41.1760387657548; Mon, 13 Oct 2025
 13:34:17 -0700 (PDT)
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
In-Reply-To: <CAHk-=wj8mfMkkLFXdMLyAzUPRH-m1h=+uJrJFSxQSRuRxbi-iw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Oct 2025 13:34:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UjA8+pZoXMh9WgCHZAUX=pd7ehWxuu9kTFr5Dp5O-rCQ@mail.gmail.com>
X-Gm-Features: AS18NWAPRsrWn-aIbjhvPb225lTn4hvzzD2saDZZv1NwVCJfaRZRj2biCqCKr2c
Message-ID: <CAD=FV=UjA8+pZoXMh9WgCHZAUX=pd7ehWxuu9kTFr5Dp5O-rCQ@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, "Theodore Ts'o" <tytso@mit.edu>, Steven Rostedt <rostedt@goodmis.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 13, 2025 at 12:20=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 13 Oct 2025 at 12:07, H. Peter Anvin <hpa@zytor.com> wrote:
> >
> > This was the *original* definition that I proposed, which was vetoed by=
 Linus because it didn't provide a clickable experience.
>
> Yeah., I still don't believe that Message-ID is any better than a link.
>
> And the only believable argument *for* this all is the "one-click experie=
nce".
>
> Because I still believe that "if you use tools, then 'b4 dig' is
> better than *any* pointless tag that just is entirely redundant and
> only cuts down on the available information".
>
> So the one-click argument actually resonates with me, even if that is
> very obviously not the workflow I use. At least I *understand* that
> argument.
>
> All the other arguments seem just disingenuous in that they literally
> give less useful information than "b4 dig" does.

Wow, I hadn't heard of "b4 dig" and it doesn't appear to have landed
yet. ...but I searched and it was easy to find a reference. I'll check
it out. Oh, it's using AI. I guess my suggestion that we should use AI
to solve this problem was more on point than I realized. ;-) ;-) ;-)

OK, I found Sasha's RFC [1].

The first thing I note is that "b4 dig" takes a Message-Id as an
argument. So now I'm confused. I must be misunderstanding the problem
we're trying to solve with the "Link:" tag?!

From how I've used it, the "Link" tag allows you to start with a
commit hash in Linux and then go from there to a mailing list post
(and/or Message-Id). ...and then it was suggested that we don't need a
"Link" tag (or anything containing "Message-Id") because "b4 dig"
solves the problem. ...but then "b4 dig" needs a Message-Id to work?
Eh?

[1] https://lore.kernel.org/all/20250909163214.3241191-1-sashal@kernel.org/

-Doug

