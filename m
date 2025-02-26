Return-Path: <ksummit+bounces-1956-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C73FA46D52
	for <lists@lfdr.de>; Wed, 26 Feb 2025 22:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10A583A226E
	for <lists@lfdr.de>; Wed, 26 Feb 2025 21:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B4525B66D;
	Wed, 26 Feb 2025 21:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B/fv+IRh"
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EC02571A9
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 21:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740604926; cv=none; b=MoeDhLauRs611dwlfT7uFi+iV/QB57xS7DxNKlhjA9yqxDu+YWmU1tqakOPskeu+7ybrjEGguy1uYMUlKixCnc1yhfv6XbU+5niXQb11S0kdAxCGHsxdDYbFvRfxIVWB1Gg6hFO67b6ibgbnu7/A5TPENof3uOYRGcmY9TRHoFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740604926; c=relaxed/simple;
	bh=+N3TkM1NRoZBHh9Ynr3C7aEtzpQAI6OT4vv0R68K6KA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LeuLHlx2WPHsD/htGVqwgSeBwAdtTNrmbFGyBAxNqyG/kPdDAQllo4sJTEAy1cwd5371SR6Dc61zGQPROmKpqTKzsMlMqEMSxKIGWItPV8fr+HHJFI57aNt3tD8pmy59xZ+Y1q7IBNt2v6SNlyQ0qCberh0FjvoFh3sY4ivxg3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=B/fv+IRh; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abbae92be71so17060866b.2
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 13:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740604922; x=1741209722; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bdNIeKEV298BHIClZBktZsY+11PKkbWSpfNyTBEPjKM=;
        b=B/fv+IRhImylCELyaRP7UxABsFR2iMxqiR/Folo51S5QxvQN2vCIndTWHUFhy3g7dR
         S6NBBcuPQgpB5v+vk4Hj2deBssjdPLCNBuX9CwQklWFX97LoyTH9pt34SkH+niXcMRPc
         smZvoNuG+6uyhG1sOIVYPm3WXUvNsd6Z3Iuvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740604922; x=1741209722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdNIeKEV298BHIClZBktZsY+11PKkbWSpfNyTBEPjKM=;
        b=Fl9f0TsuOowKkEqClpxwD1+wMraTPMDI0RigQR5bf6xzsWFqSP11F+/sD1u1nDFhBR
         lSiuGMiKRBzFku1xMrb27A+6JY4ZWIMDyx62be1A/2fcOrfc6ozFp4ptbAmpBgOkkhGM
         NaaS18kL9dYRaf4r1AebkcYXkyAjjwEDJwldDoJ+F/4142vNbCQmabuhvDf5AIWHVPSl
         IqWMbJpjwsD1jIUWcrRbYdDcUsRHJKjmr54arYeyw9LZVpICbYe/y8NOkgmsI7cPL8l0
         wHrLHRO1mqHJYoOkrfyI6Zj7l7Umou3pvdMCWPZPPubAA8juygFh4hS64mZhYywzLsbU
         q5QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCJ2F+wA9+/43t+5DGbz9UYf9co+dddA+Czdevq7Z5XxZ81Ofr9eTvwoeyjunJ+o91QLriY33k@lists.linux.dev
X-Gm-Message-State: AOJu0YxXGOWeQrVAPafXGzh5LEq6rzVdkYIw56BcTQwAAJTFrZCBraZs
	vH5CRTQXxqzvwxomMybaVmIO8w7p84oSk+5EsxEFWvkyUMKjq4YTp8aOxEV/VnHVsFSqrl+PUYj
	Rkfa+WQ==
X-Gm-Gg: ASbGncuGm4wUZ+RFc2mzTJHbSRw5m+wHiRi/2c+221Mw3ixjKd65waTC0x6YeHhg4EL
	OXrjh6TNRI/m+SI8Aok8uKkTb0bfTdN3s/HYCCi03+ofoC/dKoeR9b7zg9IiesmoBDlPTb+onnE
	ceDTigBCdQPJMuJLekMJnPT2u3WjQBXt4mMXM+Kv9PLGlt6H8mNTsvq/srT3+Flhq68D5r431Mb
	xxXSfVXXBGxGNA2f3So1OjQAX3YaIMGgAXiRYmOVwlQjdtMqGnE/ubzYw65EFdVoS+r7xuDPfXR
	9iDVrY6R5G7Zo+ERvdaGnfyZL5nJtkaSrAZlhlEvJDKUMfGY+EeK367Q7/Q1lJHHzg4JiK7U6Vh
	b
X-Google-Smtp-Source: AGHT+IGjOwBLi65M4lRVsLPcve0WMjyqwvka651wnQSP4paRaYIvpfd0QWPW7uYScdKu9M3o8mNvlA==
X-Received: by 2002:a05:6402:e9f:b0:5de:b438:1fdb with SMTP id 4fb4d7f45d1cf-5e44bb36ad0mr19740062a12.30.1740604922541;
        Wed, 26 Feb 2025 13:22:02 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6dac5sm51953a12.19.2025.02.26.13.21.58
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 13:22:01 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaedd529ba1so19335766b.1
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 13:21:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNlMjWvWLRkhSGRdtR+uHhMFNQ+t4rUd1rb49PUSjFp6HB88en3Qibw+n+AzqjozvGfzADXj1d@lists.linux.dev
X-Received: by 2002:a05:6402:40ca:b0:5e0:922e:527a with SMTP id
 4fb4d7f45d1cf-5e43c17fd68mr23458418a12.0.1740604918551; Wed, 26 Feb 2025
 13:21:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at> <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
In-Reply-To: <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 13:21:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj3C7Gc7pB0BD+5dvrFWh8xNJLYgupq6parOCFk94VyoA@mail.gmail.com>
X-Gm-Features: AQ5f1JrrDtu6pQtaXDIWizvRpIKwFgJHej09xYvppc2qRPzk9XWU6Yj8paFL6N4
Message-ID: <CAHk-=wj3C7Gc7pB0BD+5dvrFWh8xNJLYgupq6parOCFk94VyoA@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Martin Uecker <uecker@tugraz.at>
Cc: Ralf Jung <post@ralfj.de>, "Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 13:14, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> That "single read done as multiple reads" is sadly still accepted by
> the C standard, as far as I can tell. Because the standard still
> considers it "unobservable" unless I've missed some update.

I want to clarify that I'm talking about perfectly normal and entirely
unannotated variable accesses.

Don't say "programmers should annotate their special accesses with
volatile if they want to avoid compiler-introduced TOCTOU issues".

Having humans have to work around failures in the language is not the way to go.

Particularly when there isn't even any advantage to it. I'm pretty
sure neither clang nor gcc actually rematerialize reads from memory,
but in the kernel we have *way* too many "READ_ONCE()" annotations
only because of various UBSAN-generated reports because our tooling
points the reads out as undefined if you don't do that.

In other words, we actively pessimize code generation *and* we spend
unnecessary human effort on working around an issue that comes purely
from a bad C standard, and tooling that worries about it.

            Linus

