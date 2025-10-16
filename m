Return-Path: <ksummit+bounces-2543-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC174BE1F7E
	for <lists@lfdr.de>; Thu, 16 Oct 2025 09:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABC75541310
	for <lists@lfdr.de>; Thu, 16 Oct 2025 07:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB002FB96A;
	Thu, 16 Oct 2025 07:43:37 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12FD2FB989
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 07:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760600616; cv=none; b=PRX8MuOch+EBQEuarA1zpPLaFOFDnMr5KpzeL6ivkPKZ+CIdSV/LesO1qQYKzw1TUsqxBKiOZUlB8PijfHwzb8EJagd0tW1iMuzrMlBvmBxc1MqqdrkO89VDjRP1FX96z0ya2mDjMXqkWGy33DcmCkLU6kYvlL5l0ZUzHcoJKFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760600616; c=relaxed/simple;
	bh=8UhuXIYdFs6fTYew8//1W3XNBlVmS3+yWTgHMLWjWJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U63dCGbfLskA/xdWdiAMXWfHBW12swE7rwTG52ZjrbyQWBJj5K0Lfix+Qb+6YS2OgPhbBDj04iVbtCed3/UtX3BAtHcSyMoYaDA77ctRXjnyDB/PveOS3uZcsXzxhhor3CEPWiAmfnrDvTr815OqUHundNhIdsJb9vGDdt9IlGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5a7b2a6b13bso278871137.3
        for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 00:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600614; x=1761205414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHwC0h0igLc+JH2OKWaHtg1S1WAWQ0aDWPpcAsC2XUU=;
        b=SC9MGMGuB4gnFEqaMpGFLGNZU96njicFdfQq22h8s+eOggPkhIruFig1xH3N+sYrIf
         9Ed4Oy3/4KJH8WlFOAeBOEPg2l2t9/Cwtms0szv8Z5ecgjwua15UtbIfaXgVOyouGHWk
         pj1X+JSeT6UIq08YfdoIPbG55bsRjJdNWSUbKSj4583+ttGouqUxNhT7tD29v1npGDS2
         UqG9Xyo6UuJZLAo/MrzAYgBzRxK6vSGrnjcPtw0gfJyb2a+cMn0ZhoaAklZ6z9cf1CIo
         Ucd3a9BtUH3V6CkIxiALhoFDpab8an7BdXLuL1bbdbJWMIVZvKXPXY9NVDhIgmbcx51e
         zIjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhQjc0vN5Zg22uZiNAgdd1t60uScM/1RHWlQ/T2y1aCwTlqOFo4HKl6J9S5Zlkiy6B18ur3qzk@lists.linux.dev
X-Gm-Message-State: AOJu0YzjZOgRq447+rGlOVmxTOwLrNRHQgIQ6d2/muTh+uAQgkAmxqip
	DF+8WVSYJY2iWHJvoexkssvdXW6r0dp5fiDQrshxnk3e5j+WZgrbNS/qb4aR4XOU
X-Gm-Gg: ASbGnctmg/23kExEgIQjPrM8gWejM8AT8wadzbJh/UqKDNB0LC8CJRTESAcUNhnr9fL
	K9HW/9jGpumM+nmbjezcGqBjGwsLzGV+rBukI9vEHBAEpT8U3D6Qt/7pH+j50iGqrB6I7GmX7ET
	vaY70gQWeVlwmE1GhpFqe2tfBIFHwHpydkiyfa2T7HG+YGJVOOnf11lHlR2yJxg+N8pa4coy0ps
	5k7vh8As//cx6MvEbnA/whVhhhJzZWJugo4+zyrL+kowjCkyJSO2BPNJKWg5NIL+InhqDyZpymE
	xE3B3WWry8rsvgkEKtliX2C+qeraP5bYYerPavxvKZFYCmYyGwifJdv6t3sTS2S0QvICJyTFeP4
	zTK+FLr7dyYwJbwArkBqydpGUr0Xj9nlo3oFSX9dwc1HTC0Owzq4OA58NqzRD+3sP1WbJ2loa7c
	sz+7QwlA03t+N/L6TQRfI32oeQhAZFYvy4Af5l556+SR2/FRcB
X-Google-Smtp-Source: AGHT+IEYoelcyT+PFs01F5wIVxduxRbrRJZ5S6mzHdDgwCWQH9+Jal4AtP2YUl0mMRjezGHZdU8I3w==
X-Received: by 2002:a05:6102:f95:b0:5d6:27c7:e6b2 with SMTP id ada2fe7eead31-5d627c7e6cdmr4653617137.3.1760600613506;
        Thu, 16 Oct 2025 00:43:33 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d81148c6sm5749729e0c.26.2025.10.16.00.43.32
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 00:43:32 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5b62ab6687dso342553137.0
        for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 00:43:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDbkFM4tfkUSuZ0jjQF3jC6/jPe+9aEbv8Nwe31KECHorLPy9OIT/pMZxqPsNS1sRP+lkzJzkM@lists.linux.dev
X-Received: by 2002:a05:6102:cd0:b0:51e:609d:316c with SMTP id
 ada2fe7eead31-5d5e21d067dmr12822429137.4.1760600612670; Thu, 16 Oct 2025
 00:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com> <8572506ccdaa6211e177d5976a74737268486492.camel@sipsolutions.net>
 <20251014153521.693907a1@gandalf.local.home> <c311cf11f2e0bc2046c428e398508010c7626855.camel@sipsolutions.net>
In-Reply-To: <c311cf11f2e0bc2046c428e398508010c7626855.camel@sipsolutions.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 09:43:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWnWTB4ENO888t+4G01VsPtZqzjdfw1ZpS2so8VnD5uQ@mail.gmail.com>
X-Gm-Features: AS18NWCsk3QncgrN77GCp2drrweAH0HJ9SFLch3WJjUroTte8MZyfj4ijAekkE0
Message-ID: <CAMuHMdVWnWTB4ENO888t+4G01VsPtZqzjdfw1ZpS2so8VnD5uQ@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Thu, 16 Oct 2025 at 00:01, Johannes Berg <johannes@sipsolutions.net> wrote:
> On Tue, 2025-10-14 at 15:35 -0400, Steven Rostedt wrote:
> > On Tue, 14 Oct 2025 21:12:33 +0200
> > Johannes Berg <johannes@sipsolutions.net> wrote:
> > > And we're taking it away because literally *one* person thinks that it
> > > adds irrelevant noise.
> >
> > Are you suggesting that we lost the "benevolent" in our "benevolent dictator"?
> >
> >   ;-)
>
> So I'm supposed to be on vacation this week, but this is haunting me I
> guess ... I see your ";-)", but I'll respond anyway.

[...]

So, can we please get our Link:-tags back, and get back to real work
(or vacation ;-)?

Thanks a lot!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

