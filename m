Return-Path: <ksummit+bounces-1801-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C3DA3FFBD
	for <lists@lfdr.de>; Fri, 21 Feb 2025 20:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1FD219C753E
	for <lists@lfdr.de>; Fri, 21 Feb 2025 19:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068A42512E8;
	Fri, 21 Feb 2025 19:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eTp0GTeo"
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5393517591
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 19:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740166263; cv=none; b=o8Nqbo6OkhtTBuoK0MtmaDePScJYgJBv4bdY5VXm4vB4JIORzvd3qjLf6bGBab2N3P4AOn8ch0/RDy6e7kmYdLyv2W4l5jHL55qebaOeIDLizc4/XqIOKqeYs6FGCj/u5r0KqkTtOzdw48rvFf+0/92KdXc1kx2ABWUt62lgOAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740166263; c=relaxed/simple;
	bh=+RfEgo2NPzN8K1yBWcrB0J1ymaB8NkbaJD+o1y0UEQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RnB8XqtbZ0RrJgJiK2/Q6+rHai0HQqq5dv/5wsbZsMdf21GpMMU3jm2n5NImIDU4bJRcB4SyocwhYu0piO6kwtto1oGn1fs2L/BzCdpbH3FFX0G8iUEoagLoN8TvXf0d2uTr4r7Ufi/pz3HcQhNAGwP5f9QAEy2uPBjoQrenADY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eTp0GTeo; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so3462277a12.1
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 11:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740166259; x=1740771059; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5CaSzc1+NZ6cbiR+JimbofLj0D3GrK6Qy70Ol4U5T84=;
        b=eTp0GTeoY+cKwbcHcFLktI3TFPym/OtS2zftI8vtfygM5dkERj22+BftpCD9t1jSTh
         pnZQqC7IL1/Ayxf7ab5Synkd9f9C5afykZ9hFd+8xemj9tMv8ZHLFPZYNsy9EAkF0qCO
         VSbKFAJfQuP4yHps4JUIK8kT+Te3THSeGDiIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740166259; x=1740771059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5CaSzc1+NZ6cbiR+JimbofLj0D3GrK6Qy70Ol4U5T84=;
        b=i7o/mS17zgPcC3FU5zR/TyC3uti1yJ6vvCq6gpM0nt/7IExWHyQDGq8s9P7ikaYivI
         kO3SO8SGaoTMgcMEYrthzLc2zS2Qx8ax47PXJ7TVzN8F4ASxIhUGLluKuTEFjys+fnUs
         00cGBJjUurgrjEisScWcBoNZCi8dhqszIYJJJ9eNcSVEvmE+5iD/RslBURzIVCj3LhjE
         EoePgfLnKgJ9mWW93O+rDLsMSZNn1/z/ZL64UAnXZ7XGKjKiFmvCORTHTSbR/lAT6Ozq
         BBWr0k9eNz+acGjPCAi5JIOpoDvqtvU9a239ssHNCTj6a9Id8Xr445WIqm0GKNG6rzrb
         +lHA==
X-Forwarded-Encrypted: i=1; AJvYcCW9E9kKcEkk8UMnmyVxAqVMZ2jf1slvYdpfc9c/4BUS6QxEHTo/+5/QXCh/jYUvZ4FUdsfdRBE0@lists.linux.dev
X-Gm-Message-State: AOJu0YzyTwAABHzcZMDnZUno7g+jbPBGJTwoNMXEYDyJJGUYVOk39Sr+
	HJv5swqf6cJVzpihu0mMZDPkJaijXn3M2G008z0wCg5aLuS2h9YFFD4m17lHxsutzyBLFmIhpxO
	jVZo=
X-Gm-Gg: ASbGncu2srEyunHMTgf0MmAMrRKh46j7da8e6C2Q93tdoDwJQ2pgD19lTdyXAjGF8Gv
	3lz2nvaFHVCya3Gp9VpMINdRT4MK9KMvhrhEBiQcBgitB2kmhlBRvlvyh455hrAIx5Nm3W98to6
	+5blhoj716kK010rIXGJX5nF9B9QRzzuy/jff2lFGbp4yYcs92POWEli2E93OOcn7gQGcXbAC/z
	qk3pVwy95Mqn1nG/APrxCWxiHAIjErDx+EATv6OZW+Jm11qEZKmKZN3doUA3G7ogV3aQhq7JmD+
	uaaoGZPPVdicVtdLYBiVTVoDorARI4wvgQE/Bee1jfmC2L+5YwCARo4mWiw2VDvJx+Q+whVohj7
	u
X-Google-Smtp-Source: AGHT+IFF8tYq4IqcyZ+qKVyeRAylos9QknksUXCkZEesE4FZQRhrxHQL5WUvgmfFjUuWFHqZ+VCAeA==
X-Received: by 2002:a05:6402:234f:b0:5df:b6e1:4690 with SMTP id 4fb4d7f45d1cf-5e0b7106a9cmr9778755a12.12.1740166259378;
        Fri, 21 Feb 2025 11:30:59 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba9657249sm904308766b.38.2025.02.21.11.30.58
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 11:30:58 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaedd529ba1so300597566b.1
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 11:30:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzNxjoKvlWqj4U/BdwponXpNafh8lCV9n4qqitgnmJa1LI6c0tw87aEmTsEzNWqhJlISZpTni2@lists.linux.dev
X-Received: by 2002:a05:6402:530d:b0:5dc:5ada:e0c7 with SMTP id
 4fb4d7f45d1cf-5e0b7253852mr10092967a12.26.1740166258146; Fri, 21 Feb 2025
 11:30:58 -0800 (PST)
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
In-Reply-To: <6b3e4d3bdc9b6efd69068e5b22cfd05d370aed19.camel@tugraz.at>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Feb 2025 11:30:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg=pZvE9cHJUPKGCajRUCtDoW73xwY5UfJApCWms_FgYw@mail.gmail.com>
X-Gm-Features: AWEUYZk2ROF9Gz3ijYo2QrCtR7asAMoIhd-gvs3NVhzWEfN_JKozPalppZ_7PrY
Message-ID: <CAHk-=wg=pZvE9cHJUPKGCajRUCtDoW73xwY5UfJApCWms_FgYw@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Martin Uecker <uecker@tugraz.at>
Cc: Steven Rostedt <rostedt@goodmis.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 10:31, Martin Uecker <uecker@tugraz.at> wrote:
>
> The issue with __attribute__ is that it is always tied to a specific
> syntactic construct.  Possible it could be changed, but then I do
> not see a major difference to _Pragma, or?

Oh, _Pragma() is certainly more usable from a pre-processor
standpoint, but it's still garbage exactly because it doesn't nest,
and has no sane scoping rules, and is basically compiler-specific.

Don't use it.

It's not any better than __attribute__(()), though. The scoping rules
for _pragma() are basically completely random, and depends on what you
do. So it might be file-scope, for example (some pragmas are for
things like "this is a system header file, don't warn about certain
things for this"), or it might be random "manual scope" like "pragma
pack()/unpack()".

It's still complete garbage.

> > This is non-negotiable. Anybody who thinks that a compiler is valid
> > warning about
> >
> >          if (x < 0 || x >= 10) {
> >
> > just because 'x' may in some cases be an unsigned entity is not worth
> > even discussing with.
>
> Do you think the warning is useless in macros, or in general?

Oh, I want to make it clear: it's not ":useless". It's MUCH MUCH
WORSE. It's actively wrong, it's dangerous, and it makes people write
crap code.

And yes, it's wrong in general. The problems with "x < 0" warning for
an unsigned 'x' are deep and fundamental, and macros that take various
types is only one (perhaps more obvious) example of how brokent that
garbage is.

The whole fundamental issue is that the signedness of 'x' MAY NOT BE
OBVIOUS, and that the safe and human-legible way to write robust code
is to check both limits.

Why would the signedness of an expression not be obvious outside of macros?

There's tons of reasons. The trivial one is "the function is large,
and the variable was declared fifty lines earlier, and you don't see
the declaration in all the places that use it".

Remember: source code is for HUMANS. If we weren't human, we'd write
machine code directly. Humans don't have infinite context. When you
write trivial examples, the type may be trivially obvious, but REAL
LIFE IS NOT TRIVIAL.

And honestly, even if the variable type declaration is RIGHT THERE,
signedness may be very non-obvious indeed. Signedness can depend on

 (a) architecture (example: 'char')

 (b) typedef's (example: too many to even mention)

 (c) undefined language behavior (example: bitfields)

 (d) various other random details (example: enum types)

Dammit, I'm done with this discussion. We are not enabling that
shit-for-brains warning. If you are a compiler person and think the
warning is valid, you should take up some other work. Maybe you can
become a farmer or something useful, instead of spreading your manure
in technology.

And if you think warning about an extra "x < 0" check is about
"security", you are just a joke.

              Linus

