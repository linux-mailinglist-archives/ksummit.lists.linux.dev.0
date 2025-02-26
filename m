Return-Path: <ksummit+bounces-1955-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3740EA46D37
	for <lists@lfdr.de>; Wed, 26 Feb 2025 22:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D801A3AC4F6
	for <lists@lfdr.de>; Wed, 26 Feb 2025 21:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE6925B675;
	Wed, 26 Feb 2025 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="L34wdAmE"
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1102425A2DB
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 21:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740604497; cv=none; b=cEvv7JOi5rFwmealmIJeK6OBrRz83sSxhvYY43GA4kmCfo6/MBvNISZVfQP9vx7E3pTbnCgS7b7kRxpWEoP4uyJQfvcY9bGNtDHXTBXmKuBQOgcbxiXX8SFhz/Dhx8MNw9R7MseUIHfmyAigsb5DqObKhuNLzOsG1Nc1vfwI72o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740604497; c=relaxed/simple;
	bh=A5PaH4enkrbYDM7nXZ+Ass9AMQsZEd0mjSntP6Y0BCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/JJZVm+eoPQ4iSSc4zT8xH+RQ7ST6UvCoziMqHvalkd46aCA4fL2VsFIuW27qRpCPHIEDYvY5hhB+SeAyRBNoiZmsnKOg32GgLUfENQ8qVWtjQFF2Yu5hCn7Q3XeAR7N7Dgvq+9xtr2RbAzgATHIiGVEZzZNyVFJu1nadKdopE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=L34wdAmE; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so267247a12.1
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 13:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740604491; x=1741209291; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=plHH0IcN9eXsv1E/PqFvNYQwN4wb6pcqv5JKjVIOwQQ=;
        b=L34wdAmEKN1RQe48uczlmzsn981dye5L6a8yaJJqQivEXSoMI8V2NEZ2rnfjR50hJW
         MPUq75ai3Q7lwSwBwFYsNkgfGlV7VkCt2BInObCnRbwgfOJ2pLpMBnMjSi3MPa76scle
         Zz4DPJa07KxpsDl/ufML1Pz5WPMCOfiizQEoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740604491; x=1741209291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plHH0IcN9eXsv1E/PqFvNYQwN4wb6pcqv5JKjVIOwQQ=;
        b=MOe7z56E/lUfG64mrjapt3sC97w+AnNVVu3tQ33bmGO/pwtM9B8EgZllW/yVa09oyl
         U2/J9h4pTz02Jae8sRyAN0yLrh9ealpLiAgAv0RcNPyBd+UHSzBAJpPBEWaAl3fgj5en
         wJdLqJVBWT2OZi+WX7KHSOOYotMJBpkt16P9P1s7hl7FfaGLpRyHSzqGNM5za4uJNwvQ
         k403sME2RBcn7ddYyvZXe3fF8ayyoC2ven9iK8jNS4ulXElThg8SxNI4ztLYK7QRxTms
         aqy5ggdU46bhqRr2sUOV+2lvyQ395zQ4/RuRKkOGQquU7AemZLuJ2XkmSo+KRfBAkttp
         ckPw==
X-Forwarded-Encrypted: i=1; AJvYcCVktzizwwafQlqAU3VdGuNRmOI/v7HWe/GUKbGrPm01kwoeW2gm5+pTang2DvvxiIkFk//77p7f@lists.linux.dev
X-Gm-Message-State: AOJu0YwqPxSSliqk/4zEU8iUOtw5bfjq3Krq6NAFnwFOl/CWK04RpLyl
	Iqap37BaRia7d/RXJ/iC7ZrVicAttFQnr6KiindTOW6RQLcQy0ZqXX6sakI3iFQx1Nyim9KxdPp
	+I+uPvw==
X-Gm-Gg: ASbGncuP3xXlVemOYWemrE+qM3NU93YSQZmcoLW37BsoA1rFZmlX5VON2+9uB1QCBQN
	LlKRanu5YYilN7wP0oOPHlxRKdbK6panvfSpUoN6H0poGNp3r4qi15YiAPGVItVGS/45+n6fM7W
	iAFL1NyIY2hRmxA8VXh9TC7d2IHqUPjmfEGO6UGuyl2Ays3GPVF4hHCyPdXVNYLVOwUQqhQ+egd
	7HQSWIAcIvZjLfyTu+Jovy4neCsJcLcjfg0LEGdhtE3by882+huX2onx5gy+zG/J0DCQBn08Oqf
	+AXXG+QplgACOlEL6RWDzUbkk13oNacFrkAcXk3PZns0WNuB8hqMcSLDqw/X3F4ZnSNJLq6b3Mw
	W
X-Google-Smtp-Source: AGHT+IHHj7DCE+bWBwtbxHX1nX1/QGsIEYwUvfv+gZQYqOMSpCa3MnVddcjQZHFh/ENQBGx4CmxLGg==
X-Received: by 2002:a05:6402:280f:b0:5e1:8604:9a2d with SMTP id 4fb4d7f45d1cf-5e44448116bmr9691987a12.4.1740604491022;
        Wed, 26 Feb 2025 13:14:51 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb58f7sm33180a12.57.2025.02.26.13.14.48
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 13:14:49 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abb9709b5b5so31305166b.2
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 13:14:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKVVO9Ld7N2YPI2Rhc/+nTgwefXxnrUzA8S5Sct1YpxQ7A5/CZX6y43PykEU8owIVlmv3SVU/M@lists.linux.dev
X-Received: by 2002:a17:906:3150:b0:abe:c894:5986 with SMTP id
 a640c23a62f3a-abed100adb1mr883763566b.39.1740604487746; Wed, 26 Feb 2025
 13:14:47 -0800 (PST)
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
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
In-Reply-To: <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 13:14:30 -0800
X-Gmail-Original-Message-ID: <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jq-snYj9HKjCJh9QYG9k368Ub3WE-vsH9QCuPSV36deSRojSaVqyhZUuTw
Message-ID: <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
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

On Wed, 26 Feb 2025 at 12:00, Martin Uecker <uecker@tugraz.at> wrote:
>
> The model is exactly the same as in C.  One defines "observable
> behavior" (to use C terminology) and compiler can do whatever it
> wants as long as it preserves this.

The problem really is that memory accesses (outside of volatile, which
is defined to be a side effect) aren't actually defined to be
observable.

Yes, yes, the standard _allows_ that behavior, and even hass language
to that effect ("The keyword volatile would then be redundant"), but
nobody ever does that (and honestly, treating all memory accesses as
volatile would be insane).

> As Ralf said, the difference is that Rust makes it much harder to
> accidentally trigger UB.

Yes, but "accidental" is easy - unless the compiler warns about it.

That's why I basically asked for "either warn about UB, or define the
UB do the 'naive' thing".

So this is literally the problem I'm trying to bring up: "aliasing" is
defined to be UD _and_ the memory accesses are not defined to be
observable in themselves, so a C compiler can take those two things
and then say "you get random output".

THAT is what I am asking you to consider.

Pointing to the C standard doesn't help. The C standard GOT THIS WRONG.

And yes, part of getting it wrong is that the standard was written at
a time when threading wasn't a prime thing. So it was somewhat
reasonable to claim that memory accesses weren't "observable".

But dammit, doing things like "read the same variable twice even
though the programmer only read it once" *IS* observable! It's
observable as an actual security issue when it causes TOCTOU behavior
that was introduced into the program by the compiler.

So I claimed above that treating all memory accesses as volatile would
be insane. But I do claim that all memory accesses should be treated
as "USE the value of a read or write AT MOST as many times as the
source code said".

IOW, doing CSE on reads - and combining writes - when there aren't any
aliasing issues (or when there aren't any memory ordering issues)
should absolutely be considered ok.

And doing speculative reads - even if you then don't use the value -
is also entirely fine. You didn't introduce any observable behavior
difference (we'll agree to dismiss cache footprint issues).

But if the source code has sa single write, implementing it as two
writes (overwriting the first one) IS A BUG. It damn well is visible
behavior, and even the C standards committee has agreed on that
eventually.

Similarly, if the source code has a single read, the compiler had
better not turn that into two reads (because of some register pressure
issue). That would *ALSO* be a bug, because of the whole TOCTOU issue
(ie the source code may have had one single access, done sanity
testing on the value before using it, and if the compiler turned it
all into "read+sanity test" and "read+use", the compiler is
introducing behavioral differences).

That "single read done as multiple reads" is sadly still accepted by
the C standard, as far as I can tell. Because the standard still
considers it "unobservable" unless I've missed some update.

Please do better than that.

              Linus

