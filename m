Return-Path: <ksummit+bounces-1972-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6597A46F4D
	for <lists@lfdr.de>; Thu, 27 Feb 2025 00:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB4D0164C39
	for <lists@lfdr.de>; Wed, 26 Feb 2025 23:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1452C2702C9;
	Wed, 26 Feb 2025 23:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WGP++zPk"
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4BC2702A9
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 23:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740611952; cv=none; b=qwO+6HM28Q/1AEhOF+QMe50/BGf2jWtahM5VMfkZseZHEfMrAj0bkmyn861KMmFPWIRd1HWuViuYYqWs4HNkL14Gs8oBRJdPJ67lx6O8fkYSeEbTU9k14n4Jw96k1UpzYhJY3Fk9SFuPlooITSBNME2Mv4KBWINKsY8ToOByxBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740611952; c=relaxed/simple;
	bh=foxtZDCBK0dn9bc6Jbpi3rbKPKA2AjNZ4xGSo4ZEHaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3RbUPzVzvxSNKapXvXQ+IIIXTxrPVGIPwVJ8tUKbr8Awg8EIGGVWA5g+Cqfx11GC9H4MUIbSP9vPt/U2VIEeR3OfgfetYif+NUIHl+sRoUIr6C+5VB7ugeE8vX24ZdiUkvOdFZi59Xy3js55DJiAr/fx0RXKRAER9raBftYEyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WGP++zPk; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e0813bd105so393595a12.1
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 15:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740611947; x=1741216747; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TraiYlbomd4QL3tOowrIKCTC40aTkxfdwA2KJAFj9MU=;
        b=WGP++zPk475RXJAarb/dm+loJxKfC+B3NLzbApQbBNhfv27u1HNPo8jIaOg78aPCzu
         lrf60nbiZ0csTLvsk911vdl5h42K7opR9JGTZwe4IouHwk6wb1vU3vcMULx/SpaNgoQX
         1Qa5vT5gI2R7t6jrJADMTq7v1lgujmWn1WTpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740611947; x=1741216747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TraiYlbomd4QL3tOowrIKCTC40aTkxfdwA2KJAFj9MU=;
        b=hOvZfoYfEzT1ImnxSyFlYkZ4x2EnNO91AwLPgT6uDAWa5g7ZL8GpWot6NlAHUTi3fA
         kqZi1FY0Q6ml7b1mKT1QztX0fBwqe4XJ5nH83nl3M3jEjwJlmYth9LwgAzK5Nh3zdnDh
         54Hn4LaLYRrRGrfX9RMdBy89mvf0KOYBU8sc9Oj43C47wRlfd9zM1tAjqPoVO7tVQJP1
         cuY/kohLLH/SgfemJySlTe3SfVL7Mpv4XS5ErdYZBRW7qAvPFbjz0//dAYW8qNL6qM99
         O0qfZTe1Ww0TDz2lb2PMkZiur2sxGnP8ZTPzjnJL4CEZ7YaY4DNMPGv6YGttRtQ3hoAw
         bo7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLBWJTLESKLzt0gRQxphaYCS9Y6MqwYtvfxWAws95WOC5DdbonS4RNLM8qp0tmehlAt5oq57Vn@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdktx5pmgcARsoGmTBpwbGijaNApxrwtMfVU1dzTHotrBD8tXY
	2XcKU1vsOznGbvGO47EY41HM/aurhlTgZJ5f4w2NBh8iR27CoxVwlfMZJUuqHd6uX3kEThF2ai2
	fTgNwTQ==
X-Gm-Gg: ASbGnctj/zrS/AwWcM6jkDKI0MEqAZP7/PhRwwMV0CV36PtoqeHdQnQiwTeUg2nTEMV
	Z8CDXAaXjliqRqWKUoH74TkqQ3TYjvtV5zF4GE65F43TMqmsHK+7iSaMWK/AszbD2CTLWY57wBO
	2e/yO3VI9G86jr52YWYxNMY67oIHwOsli09Smq6zxNua99t2ZbmPY6NlXYTf1DbGCJKPlhX/WUQ
	CmQUpV+v0O0BM5XcIbjRhs1OkELvI6C/BUXYJnwtlXPS8zA8Yi9FJvhYE5zVewK5CYFQn/vj66W
	GIpR83KU2ZqWWnM2lsFcMFAfV7hg/LfDjam3X/ar/13HRQ9IvBd4Bz8Cc9A2VDTlhsX6c52YChy
	D
X-Google-Smtp-Source: AGHT+IEqeUiPDyaZuR4Nu6ZrZ1v9aK2HhoJ9rs+1FSP7yMNzCBhHiRVtOo5nbxnzj/z7tD4Y6WI2eQ==
X-Received: by 2002:a05:6402:27d3:b0:5e0:9959:83cd with SMTP id 4fb4d7f45d1cf-5e0b722eaccmr21945619a12.21.1740611947558;
        Wed, 26 Feb 2025 15:19:07 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b4a734sm175885a12.4.2025.02.26.15.19.05
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 15:19:06 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abb75200275so42832866b.3
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 15:19:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVX81pWqWDXzZSuDtvEAS/rryAxhBoZxIgc68zEDDt2jXjIy9qKhLlqttlP/fPKHmuJY8H8fCq6@lists.linux.dev
X-Received: by 2002:a17:907:72d1:b0:abb:e7de:f2a6 with SMTP id
 a640c23a62f3a-abc09e35401mr2910896766b.53.1740611944724; Wed, 26 Feb 2025
 15:19:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
 <20250226162655.65ba4b51@gandalf.local.home> <CAHk-=wjAcA4KrZ-47WiPd3haQU7rh+i315ApH82d=oZmgBUT_A@mail.gmail.com>
 <20250226165619.64998576@gandalf.local.home> <20250226171321.714f3b75@gandalf.local.home>
 <CAHk-=wj8Btsn0zN5jT1nBsUskF8DJoZbMiK81i_wPBk82Z0MGw@mail.gmail.com> <20250226173534.44b42190@gandalf.local.home>
In-Reply-To: <20250226173534.44b42190@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 15:18:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=whvzK6ugXhCdrTfXnkFR+u_+sCtwz4aDODJ_h-RJ3kOKw@mail.gmail.com>
X-Gm-Features: AQ5f1JoJL1av6p0bHCUuCTiHUulziFdE8-qs-EcbEYZ32grw4GEJZn_MqtGet6I
Message-ID: <CAHk-=whvzK6ugXhCdrTfXnkFR+u_+sCtwz4aDODJ_h-RJ3kOKw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Martin Uecker <uecker@tugraz.at>, Ralf Jung <post@ralfj.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 14:34, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Correct, but if the variable had some other protection, like a lock held
> when this function was called, it is fine to do and the compiler may
> optimize it or not and still have the same result.

Sure.

But locking isn't always there. And shouldn't always be there. Lots of
lockless algorithms exist, and some of them are very simple indeed ("I
set a flag, you read a flag, you get one or the other value")

              Linus

