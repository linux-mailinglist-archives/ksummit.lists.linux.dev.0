Return-Path: <ksummit+bounces-2505-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D125BD5ECC
	for <lists@lfdr.de>; Mon, 13 Oct 2025 21:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 277C8345A12
	for <lists@lfdr.de>; Mon, 13 Oct 2025 19:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691A92D8774;
	Mon, 13 Oct 2025 19:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VcyroWD5"
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F0925F78F
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 19:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760383235; cv=none; b=DdDN/MruSPyFrVFa0ClXMZ6AE9UxeeZgGaa/r12taqgoUWG/zcIxnKFY+2Gm8u+eWaV7uVzftveV6CSkiqHQ0VtSDK3cRY6+gYBZvOSRlAZ5opmID64FwM3UYuVlPTG++fBPO3VC0X2vfFvcYadaJlumOKbEWFysM/63zQq72uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760383235; c=relaxed/simple;
	bh=xXF9SOww8NW5GJV2epWLLWOy5hp5IXU05GONNJ8S/H8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjDCTAXrHpAhEyigxARTVR1aGrfJkGflvZHLaGVJbZTMMHaEsfmRKb+jftHRxLPfg0d4sR3WCJBLfL2pWcHTr3+hP72N96ZNxQYKQG+XH4XL9McQs/5fJeg7tqnJJS9puo0rFmS2eYgBoRlwzzTKRTV5PSGwT76KfPu+xhh+13U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VcyroWD5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so780489066b.3
        for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 12:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1760383232; x=1760988032; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N4w1vvIVqtm7wLG/32MkGzAowrWYbfpQD1X5eO0DiCM=;
        b=VcyroWD5Eu37BMdRmpTeJ3z3VOv97zfSMSo0NfIYjmPysj13VWwWxxhbjoU7o9zDrL
         GBv8DKAuyxhlC8PSixAyNzJ8b/gaxgRi8apJR5PpcFBF+bZnI6pOvFDRamqxbAtur/6h
         lEOeUU8JCJn/D1eQC3tXQFXV7fRjvmjSaMeKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760383232; x=1760988032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4w1vvIVqtm7wLG/32MkGzAowrWYbfpQD1X5eO0DiCM=;
        b=J5Tes2eTlHNSgJWuZ9Gds5bjGj0kEF4qeUPwQAsQyi+dzE/SId63Zr4+T3tfK5TutG
         6AjiA1f0zBIweqS3jc0oqSb7enR7oLhdubgvviy6fQX6Y2P3la4zx8wsRV+xVqOO3c5m
         93R5hZD6bXh2Ba0jhGwA86ThZwN+dwqT76ZCG5Grl/ADIFweRkzpZAMjRtRBTifBte7X
         n7bYSf0cIlpxiqh2Im5zA/l3E27d//E2+3pTOp4oRG3NlWAaddqAogod3htfjaRdi9+Z
         UiK9jSXyyNrvqyAbD0Jtz/O5TkWYN0i7vq5zlY6hQylzLNYMWQ61PGGToppkHsisno/t
         B1uw==
X-Forwarded-Encrypted: i=1; AJvYcCW1J4Vdfa7dCNweuTlL7cWLCtle/17Uwo96zwtI7K9J8WTJPpFQTG0qC8iTmP28x+kL4L+JiGWl@lists.linux.dev
X-Gm-Message-State: AOJu0YzBNFYM5IZXe3YH2z7ZRr7ZXJzR71rxmyB27zckAIsv6txps/J8
	pVepjFNR3l0Dou82sRUISBqKJZg8/Cz26dY2n+2X1RgR7Mwi57Rl2+tWasqk9ZmTIWcu4E6tgYV
	1W4ua3a8=
X-Gm-Gg: ASbGnctxMayLaMYZHLyfxPI525pmUYD6Kavie+PBpx99/6e17i0Z3NIZywnuB1TwaX1
	2ylYx3hKKivLkC6olw4H7axvmmm15JHeKND2TO+zLvLXsJG4Bre/qyIG4EoDwijGoxiNeTGcdKo
	stgrKgbhRnOi1dZR2asxcirvnyznKM+9JPQaq4Y3JpHcrWT4R1XwyE3f1lvR5OGMeIsgBKkLBtv
	CtnwvS7DbGmI770qBoXf0mI6iP90YnZLaWJw7mGo6YPowU/6iz2rf4hqG6vDz48NvyCHJ9/S2D/
	Vqj5jqUgEn59vY650FWd4Q37AZ3qb/mviovFaC5t0UfRIkYklA/XQeQ5pZeFJOf+EGbzNQH6MjL
	FMK6PchNCnCTOfXbEa5BWYieL8ULEv1MDNROc0+dyNMCp9t2lr3LO0fUo/JyUmC1qjS3pMkrUPu
	UYCSFsAe51fwtbJldLYqjDYHtzBQ==
X-Google-Smtp-Source: AGHT+IGcpADD1ClORqDnAsIX5a9/z+4ZZGT3gIocYcTkWjBFb0KHS2apZ1jt5L0iuJ8pVRDg0P0gaw==
X-Received: by 2002:a17:907:72d3:b0:b42:9840:eac1 with SMTP id a640c23a62f3a-b50ac7e7a29mr2281678566b.49.1760383231675;
        Mon, 13 Oct 2025 12:20:31 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm1006153066b.7.2025.10.13.12.20.30
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 12:20:30 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-634b774f135so7289873a12.2
        for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 12:20:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYnSpRR1XUpZeCBR12juSTHvbcxIYe+cWKe29q1wB4I9oiyv4n0uhGST/eQjSb61Ut557RLhIk@lists.linux.dev
X-Received: by 2002:a05:6402:518a:b0:628:7716:357c with SMTP id
 4fb4d7f45d1cf-639d5c4fe6fmr18881150a12.25.1760383230452; Mon, 13 Oct 2025
 12:20:30 -0700 (PDT)
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
 <7EE2713D-7612-4EAC-9E4E-225A92FEC9D3@zytor.com>
In-Reply-To: <7EE2713D-7612-4EAC-9E4E-225A92FEC9D3@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 Oct 2025 12:20:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj8mfMkkLFXdMLyAzUPRH-m1h=+uJrJFSxQSRuRxbi-iw@mail.gmail.com>
X-Gm-Features: AS18NWCM61Me3wXehXYYZh3uW0-DEg3xlg6zIEDz71I5P67I1b2Prjnj9bBl838
Message-ID: <CAHk-=wj8mfMkkLFXdMLyAzUPRH-m1h=+uJrJFSxQSRuRxbi-iw@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Steven Rostedt <rostedt@goodmis.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Doug Anderson <dianders@chromium.org>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Oct 2025 at 12:07, H. Peter Anvin <hpa@zytor.com> wrote:
>
> This was the *original* definition that I proposed, which was vetoed by Linus because it didn't provide a clickable experience.

Yeah., I still don't believe that Message-ID is any better than a link.

And the only believable argument *for* this all is the "one-click experience".

Because I still believe that "if you use tools, then 'b4 dig' is
better than *any* pointless tag that just is entirely redundant and
only cuts down on the available information".

So the one-click argument actually resonates with me, even if that is
very obviously not the workflow I use. At least I *understand* that
argument.

All the other arguments seem just disingenuous in that they literally
give less useful information than "b4 dig" does.

"more noise for less information" is not a good argument in my book.

           Linus

