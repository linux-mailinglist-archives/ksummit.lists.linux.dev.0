Return-Path: <ksummit+bounces-1808-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8E2A400CE
	for <lists@lfdr.de>; Fri, 21 Feb 2025 21:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B297D441042
	for <lists@lfdr.de>; Fri, 21 Feb 2025 20:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5784D253F29;
	Fri, 21 Feb 2025 20:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UMG/FeA7"
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2176253B66
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 20:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169584; cv=none; b=IObXmLLfXEfpVLSOBoVoYiVbSo73luwOMHhZtPJ809zVM97Ttx+biH/f7sL9AQY6BCisK+egbqyP3Ku8qGvabPqZixOJGjD4E0cuwVKGki4AW9k+g/5FThRjz4czwgdZXjr/HBIFiEFFcrzlSPSLuJpr8RtXOZugURnK2/Fq7qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169584; c=relaxed/simple;
	bh=giBBo4caqx8Tf9a93T9eGadcf7q3hJroPXPmYCW+yTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KwSvnPMNN3qh/1ht0Ftmxg6o4zLH61tis+pB5161dWAQA9ZIs/tIUqae8OMI79Vp4lK4o2eTb/rUmHwTBTju7+6gb1YRkFyTugH0VTDoCM21EMoQ8214U3AiO9Ck/15SIqIB9UPj6Zzsj667Ai+uAOQVJsWlUacndK0g+orYzoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UMG/FeA7; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abb9709b5b5so478126666b.2
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 12:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740169581; x=1740774381; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5rQmbjlwBbLwDXvN5+jqJigL+IoD9eonvyj1f9icKNM=;
        b=UMG/FeA75ERtvLMkSSvJV17TjYyo96WbnIS0Gk13OYZviubvYezMbQ3C/Q33Aj97L9
         qZYzI2C3u6PVyPuYp9/qtmuEc8ljBLoSEezs3CtcvHrCXVGHHdsI5TXWYEahZ4d++h1t
         uAr6UYgiCTHZ89RZS4B8oIB1mjsEXG+x91zNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169581; x=1740774381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rQmbjlwBbLwDXvN5+jqJigL+IoD9eonvyj1f9icKNM=;
        b=f81G/orFkDxtO6sPBJRPbg1oCSQ0+8/Y67r25jfcf3SHsGZbzXWuOOku+KvskUkCc9
         BhHMdKEQIuDmnYhC2Ef0viYdUHAG1rICA7buJpFiWCYhvzhwFu+NCbQUSO32ChTp2Haw
         FWlfbCvHlxM2eg3DcTyqSphXbj9s31o5udy9rFH7PxihRGyvmDTOlk3NSVwVKpPXWpK+
         UbBSS07QO/eJI/hNRLuF/zqR6f4RuRlgzZKb2g3pIaGPeCl3AYO/V7ce64SabZ5ugdJE
         ArEbH7QJKuKmFS89rshsWlmVlnxFbYtUmtWC9ooxfJqUx+JK5Pp1oTilMGIg+B9hje4p
         yGHg==
X-Forwarded-Encrypted: i=1; AJvYcCWeuKcKekAlsSCgmS09aRLhfGz0wYpI0gZbtSfdGvs7mH9H+LymtKiqSE++qHy33EM8hoGJI8aQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwrmZ2P2kw5DYukPaWyBPCELM4+KiXnaSOM9cxhLiqNhiLZODgJ
	XlWtU4wCmYsFxlYUbHjPgy7/sg+p+4FBX0Zts56n/dtc84mutwOjy/W/l34J08zFz3EozgKMlDi
	W2kw=
X-Gm-Gg: ASbGncs5W/Hnhp8louxeMx+TcgEkXDnayVBmWimYEkOi9gj2OPOvCpoe1Ns3PwPg58T
	64oOvsJsyvWI4t560L0HUlsjVM8x2YEOsROgD5eNGe0bFF6RRBn9qlVadPBMrx2Uapr9qgIV54n
	bxoZNJeWFmNIVpqGCt1fei/fisUstNU45//6zmW5rUT1qr5rOXoas8TlBlw6bfYFLoQD/kYZ2Bh
	V4VLRQ2unwdFfvhMBaQuBw+NgitEVDei78CFbA1wel4v0FpThPreuVYnvTR1fKxI/JxTOVG+44T
	dvHAtFIDogJHoh/Si3PHJO5Wnc4m3tW2o75nTE6UehmqqFSpPj8Ttv5G+tH3SuKnrC1Db5T1pUg
	a
X-Google-Smtp-Source: AGHT+IHYHtfTDdr+4Y3goCyawHPi7Lv003PkusvDemq27S+kKlWb5eV22LKRxFCwfbaOBiSksrCg8A==
X-Received: by 2002:a17:907:9707:b0:abb:db78:a25c with SMTP id a640c23a62f3a-abc09c112b8mr481876366b.46.1740169580684;
        Fri, 21 Feb 2025 12:26:20 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb961594absm1083268366b.111.2025.02.21.12.26.18
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 12:26:18 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abbd96bef64so403594666b.3
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 12:26:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXWf6WUnTnke4iqXCGxKs/eZrT/kAA+FheI4fWLmhtij64MAZFqUfGF3mm6iAo9lIaE8WjE/2AL@lists.linux.dev
X-Received: by 2002:a17:907:72c1:b0:ab7:b356:62e0 with SMTP id
 a640c23a62f3a-abc09d3615bmr497772366b.53.1740169578296; Fri, 21 Feb 2025
 12:26:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com> <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh> <2nn05osp-9538-11n6-5650-p87s31pnnqn0@vanv.qr>
 <2025022052-ferment-vice-a30b@gregkh> <9B01858A-7EBD-4570-AC51-3F66B2B1E868@zytor.com>
 <n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr> <20250221183437.1e2b5b94@pumpkin>
 <p7946077-rn30-n3p3-ppp0-80o9n9p07718@vanv.qr>
In-Reply-To: <p7946077-rn30-n3p3-ppp0-80o9n9p07718@vanv.qr>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Feb 2025 12:26:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=whZwXK9shqeV5fpRF9CRqApVy5wz6myNeAkyuFm-ERTpQ@mail.gmail.com>
X-Gm-Features: AWEUYZmxOG8LoPESIjY5QVAnSYfcZ5a_0i_NpT_k6tEamu_ExBz05y6DOubwg3k
Message-ID: <CAHk-=whZwXK9shqeV5fpRF9CRqApVy5wz6myNeAkyuFm-ERTpQ@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Jan Engelhardt <ej@inai.de>
Cc: David Laight <david.laight.linux@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, David Airlie <airlied@gmail.com>, 
	linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 12:06, Jan Engelhardt <ej@inai.de> wrote:
>
> >(Apart from the fact that c++ makes it hard to ensure all the non-class
> >members are initialised.)
>
>         struct stat x{};
>         struct stat x = {};
>
> all of x's members (which are scalar and thus non-class) are
> initialized. The second line even works in C.

Sadly, it doesn't work very reliably.

Yes, if it's the empty initializer, the C standard afaik requires that
it clear everything.

But if you make the mistake of thinking that you want to initialize
one field to anything but zero, and instead do the initializer like
this:

    struct stat x = { .field = 7 };

suddenly padding and various union members can be left uninitialized.

Gcc used to initialize it all, but as of gcc-15 it apparently says
"Oh, the standard allows this crazy behavior, so we'll do it by
default".

Yeah. People love to talk about "safe C", but compiler people have
actively tried to make C unsafer for decades. The C standards
committee has been complicit. I've ranted about the crazy C alias
rules before.

We (now) avoid this particular pitfall in the kernel with

    -fzero-init-padding-bits=all

but outside of the kernel you may need to look out for this very
subtle odd rule.

             Linus

