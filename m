Return-Path: <ksummit+bounces-1817-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E943AA40344
	for <lists@lfdr.de>; Sat, 22 Feb 2025 00:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41DC817B850
	for <lists@lfdr.de>; Fri, 21 Feb 2025 23:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55436204F6A;
	Fri, 21 Feb 2025 23:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bavr4Tep"
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9C21E9B04
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 23:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740179066; cv=none; b=A9s4/jbH4guS+1TSGxb3CJHKfzItm2iGRq706M7ZYulF2p6NTFAwTsN7rMHyy4gtGh8PNQFJCEr48GWdPwVg/VuHv9fkc/J/iSwZrZxrosaM6DgLTc1CxfrCZKUcEqLNHg8Qw7M0iVYXx6hoUxEezHii0EMsQFsE3DTVb8EY3nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740179066; c=relaxed/simple;
	bh=TpbP32x3fqhhq+Cun0agcs/GSxbQZ4+wDorQANa2i5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGs7rxFRwK/HuYy2+JaRRk40HvFcvq4Ophd5yfvKvxrOFLAvosIt3nsc0gocN9A/KzsgeJV4VY6kP0gpY1UiOlyWVHV250SG05amLcZFBEICS/EPypMiYQJRMk/uN6q6rjfr2svRPtmx84SHx3l/pNnI18G7qAL2ROPH3dRcQiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bavr4Tep; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abbd96bef64so421340266b.3
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 15:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740179063; x=1740783863; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IYwQB8m9ANwEOGQVayzecy1Wa9/uVkJW9TozXVMdMGM=;
        b=bavr4Tep5glnkL21A5Q/f28SU+WB2u+HwXVE8/Vf4g8qVp79n9740WIj19c4WUzriB
         EjxDPLTIxmjfn10fMcIxwypbwYoez+FgMjHQUR2OmvDPLr00JncLsacHyM65KnHx2vXI
         ZFsm973FLHjsmKqnJmHzXyUfWgo/xAq5tOu9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740179063; x=1740783863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYwQB8m9ANwEOGQVayzecy1Wa9/uVkJW9TozXVMdMGM=;
        b=oX4Fa4W0ZwJD8UFSKoGp9jQyxL4mubbMIi6PgMEkXg4OC4fpn7jR6tcnQqLJiiSYtl
         n8XuK74YxO/mzw1t9lAc75T+G3OBLJL0pHM3yUg9puAWgkxqZCwyKJB2PgRWilGfsCib
         s7xUKgjZFkP/a3cY+9xLOr2tfWncXNVoMCzPlJKWws9+hGqhnPWw24lKaeKRxJ9C6ivo
         eVwpDF6b6bZqiy/HL3pysI6qMw7+GXNbrIB4vnGIrK6/ieTZuZk2a4MfN+7jMV8zEdA4
         +ObM0mfz9ME+kuXd+dTEMoSB8CsP+8OvApJGn6m0qr4KD1KwNXFARkfoSH1pSSOsD0iW
         Wufg==
X-Forwarded-Encrypted: i=1; AJvYcCVWai1fU+WSsp/drg/QERDHNyziYWCxXBSUs5RLfwhKT0SuXmPfADsAToIK9Pc/47SMu1YVY7UF@lists.linux.dev
X-Gm-Message-State: AOJu0YyetMGnHFtsvOJuNlvnfWFeCDe0CLRYHURt0eRCl11KO7JYm+SP
	sJ3F2oRtnd0queZm1MkWVpSCWG40dqooGC4gRLO/83ikVgb7vwNgHX0LOJuiV4S+QRjzAuuj0Ep
	15t4=
X-Gm-Gg: ASbGncusvGuGWq7bsngUgWd7ZJJp6EIRVRJ5or6XvlhconbBm/SAaPRl5wTGgggsbxf
	5aSOr6y1s2p+UuTAftxTRs88mq7iWSrb5vfvDwtYvoct75ZAHRpgmyf5c1uqzAsdHwN7psvHVsE
	+x1HI4DDqK2YHeWHutZPE5u8da722NzwTlSbUM0nya1hi36YMhRWqrmiOdmvPUGMUk4E9mvVTGg
	HOheXeUrJkzQQ2gIzexm+T7bGb5ehwyf7Etw4Sw/5lpbV3Ph/tZ0XMwCgTDphpU5an4qhxDxGkx
	EbMAiM9JSCFRxVwyvf5+FxsslbBGp7K28xlHjXJiwg8jvfRGWF9ukOtKSBKt1jkpN2SZLwn2Ytp
	A
X-Google-Smtp-Source: AGHT+IFMBypL2MXWzbGVEujQi6TDzwSjgLpX2Lix0fS/9HRf30azp29mk1YQXBEgvQ2fHRMJf972NA==
X-Received: by 2002:a17:906:6a03:b0:ab7:ef48:1668 with SMTP id a640c23a62f3a-abc09e2fa7bmr581113266b.57.1740179062696;
        Fri, 21 Feb 2025 15:04:22 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba0ab1457sm999291766b.73.2025.02.21.15.04.21
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 15:04:21 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso4825723a12.3
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 15:04:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFlkAe1vZqcK7HavjdFaZSAEbb8eDriFEosQE9ktPt5j9KlXVQtpOMvED3IUZE7AKMf2BzMArO@lists.linux.dev
X-Received: by 2002:a17:907:96a5:b0:abb:9d27:290f with SMTP id
 a640c23a62f3a-abc099d60famr532638966b.9.1740179061249; Fri, 21 Feb 2025
 15:04:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh> <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh> <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <2025022042-jot-favored-e755@gregkh> <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
 <caea3e79-78e6-4d98-9f3b-f8e7f6f00196@stanley.mountain> <61a7e7db786d9549cbe201b153647689cbe12d75.camel@tugraz.at>
 <20250221124304.5dec31b2@gandalf.local.home> <CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com>
 <6b3e4d3bdc9b6efd69068e5b22cfd05d370aed19.camel@tugraz.at>
 <CAHk-=wg=pZvE9cHJUPKGCajRUCtDoW73xwY5UfJApCWms_FgYw@mail.gmail.com> <20250221172415.5b632ae6@gandalf.local.home>
In-Reply-To: <20250221172415.5b632ae6@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Feb 2025 15:04:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjQ94GipftbNo0PbfuUxFMXFyp2bWGJJPNUngyf17Ai8A@mail.gmail.com>
X-Gm-Features: AWEUYZnMjA5m9nYAw69o9RC1JcJoFjtIPhAhLMih9-38H4I5IZG87DXfXWjPW04
Message-ID: <CAHk-=wjQ94GipftbNo0PbfuUxFMXFyp2bWGJJPNUngyf17Ai8A@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Martin Uecker <uecker@tugraz.at>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 14:23, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> If I could just get a warning for this stupid mistake:
>
>         size_t ret;
>
>         ret = func();
>         if (ret < 0)
>                 error();

Note that my main beef with the crazy compiler warning is that it
literally triggers for *RANGE CHECKS*.

IOW, it's literally the "if (a < 0 || a > XYZ)" thing that absolutely
MUST NOT WARN. EVER.  If it does, the compiler is broken.

And gcc still warns of it with -Wtype-limits. So we turn that garbage off.

It's worth noting that "-Wtype-limits" is simply a broken concept for
other reasons too. It's not just the "unsigned type cannot be
negative" thing. It has the exact same problems on the other end.

Imagine that you have macros that do sanity testing of their
arguments, including things like checking for overflow conditions or
just checking for invalid values. What a concept - safe programming
practices with proper error handling.

Now imagine that you pass that an argument that comes from - for
example - a "unsigned char". It's the same exact deal. Now the
compiler warns about YOUR CODE BEING CAREFUL.

See why I hate that warning so much? It's fundamentally garbage, and
it's not even about your error condition at all.

Now, what *might* actually be ok is a smarter warning that warns about
actual real and problematic patterns, like your particular example.

Not some garbage crazy stuff that warns about every single type limit
check the compiler sees, but about the fact that you just cast a
signed value to an unsigned type, and then checked for signedness, and
you did *not* do a range check.

Warning for *that* might be a sane compiler warning.

But notice how it's fundamentally different from the current
sh*t-for-brains warning that we explicitly disable because it's broken
garbage.

So don't confuse a broken warning that might trigger for your code
with a good warning that would also trigger for your code.

            Linus

