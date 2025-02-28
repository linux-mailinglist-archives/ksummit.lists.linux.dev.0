Return-Path: <ksummit+bounces-2021-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBEFA49F1C
	for <lists@lfdr.de>; Fri, 28 Feb 2025 17:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76DF916CE1A
	for <lists@lfdr.de>; Fri, 28 Feb 2025 16:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3DE27425A;
	Fri, 28 Feb 2025 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2mFbqmk"
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99474274264
	for <ksummit@lists.linux.dev>; Fri, 28 Feb 2025 16:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740760820; cv=none; b=RwVHIH6+ZNnbNjjw0KGRZ3O7rHftB5gGSi4HJYNtIaGLia4eQ9LzIYVeY9DPUID84Ui/4O1HjWj//HRF273qIiv+Qxgz8W4vTCsab0mXS7sFYB1WW29izzyt3w0xVIiMDxTE8g9g7bW1yxkcwNYg+sdakYued0MLq4lDeAILRaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740760820; c=relaxed/simple;
	bh=C+GRHKfQzkR44uS0nUAAm2rw9e0Wv36RSwQoLo8gkJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2LNZz64uYbGNDab1yAyNc/SN2lNKG8waiOlV2OOonOzAof/5NjkQUuAfpd5ThkIzI06mLx8p04FNwLJeewwIIEC6rmKTCqYzDrbysEmRUFnztK1OyRBybeGBRVHBrmghFty4/j9OdEw0QvjtkIG6iIR8IAGK7z5q5QBY47E5qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2mFbqmk; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c0a1c4780bso208864085a.3
        for <ksummit@lists.linux.dev>; Fri, 28 Feb 2025 08:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740760816; x=1741365616; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SE5jn44WjqWeuZdDL/OCizR5LJ3g9XZyj5hAVjTMQfY=;
        b=O2mFbqmkVXYdMANJ2ydSlPcpy78X9TL00oB2YtInMbXNMhx8XZ2NyaA3mb3m69co3O
         wDpRsiCdhYaBoQWc0btdsLVB41U9KJKZ4G+0ebHFinoGV+J30pJJxGI890FRgfwv3EGq
         dh+1MlxtusKRvQQmf0UsUOluqwXiIqWvgeXUaNsW6R//GPaV5U+EHoM1qnYTMz9Q/Zkb
         DY5PZu/E07HUc9v/mjcXgVkFRrhSsLE1oRT/x76mtxL5dw2kWjTSncxm5lyaVYukv1Cm
         td3ynxLkr1pL5z9pwpkScfxXfnrZ8PlTBLLxing7YVYVWGYkyIBqtYxzJix4hzXBCE7B
         yPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740760816; x=1741365616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SE5jn44WjqWeuZdDL/OCizR5LJ3g9XZyj5hAVjTMQfY=;
        b=nhUGR3rjugYhHfG1yqWTSWXELFF6BqX1Cli6dMLoZlD2TQdBeVZpBSSJ6ceFIq1d6Q
         JFkv9vcSf35rXN+kJN1H9zPAFHVjiurpkgyAApsbfwhNRqryGrV4y2EmBPCUO6y7RjwP
         hQWieA51tAHBFYM7m5CegGt0V5Q6izMKoDOiBLFhWCrUyi9HG/7w1+NgM8QB8j97S5iV
         KwOMFo8RQeO8p2oDeNM6E+wYq06c08GGsKoLZP64NQ/bth/vtOS1Jwc1tY4jI5WteXvg
         A86fQvOQShEl+68u7tKBDcuFMX8uJ/5It13x6aB/A2fpmhUuRS5J4545ZgMx4QzQouOD
         cobg==
X-Forwarded-Encrypted: i=1; AJvYcCV7G8SU2Si9wFlK3vqZzN/C5L9U7L+9uJJERWXNlTmgyRzVoG/qCeD33fyPuUR1OC6Xo6bzVDwG@lists.linux.dev
X-Gm-Message-State: AOJu0YwcgXDNMmKBGpjFUUajmWVNud0DYAGG5Z1KgNjb1vQGR8/LZnF3
	MDtm7Y4cG1clH5nXJyaFRIT+chdbrpp15q5xuaaEn2TeZfuJy+n7
X-Gm-Gg: ASbGnctZnqF4TfYUMzOmXKdRLkWIr6MfhaW5kOymoWZ6r6xHv+qo0KAeNdE/0xXI66s
	JUOkTfA+P6xCaoMTj2Xi/nmpNZ23oEZlj4Fb0CXxF4hYpC08sk1wVMblxcEq4pdkwlXe8MUEPI6
	IFNyoNl9WVF9GKAqIcsXrMiJOepmcuVyfZR+j4xI8ytF0Yi/5d6zL/REjG1tZKh8XAtaNbNrnw7
	uiE+oIDXnz56b1re4d/5MuYpaumR50SdxLnM7R28W/JVyQlrIMx8FhfbcQG3L6PSbMWvIYVxFmv
	TZH3FoVJ2HSsu5NvgEvQ5oeruVKR8tTm5eKzkKa3RikhZK5woKaK+BdA0yB1qmkLlqndzoxOz7s
	tjjQdusB0eQskicjk
X-Google-Smtp-Source: AGHT+IEaO1TQCjY8DFpnRf8SEUJHs5/dn6RzssKMPsxjIOhlGjRs/kUzHD/Hv3qAUYZzZCqljqXnVw==
X-Received: by 2002:a05:620a:8286:b0:7c3:9d46:3f31 with SMTP id af79cd13be357-7c39d463f87mr358027285a.5.1740760816403;
        Fri, 28 Feb 2025 08:40:16 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976cccb0sm23813856d6.71.2025.02.28.08.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 08:40:15 -0800 (PST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 36C1B1200070;
	Fri, 28 Feb 2025 11:40:15 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 28 Feb 2025 11:40:15 -0500
X-ME-Sender: <xms:7-bBZwRFqOXPQWjxQzFCuBxTQw1XjIy2_OY6CUb2C3ZpX85vH1JpDg>
    <xme:7-bBZ9wWTVb_E5g0bW0DZJZB4d5NbLH7a1FSIZuFHlSZNtana-fSW5v6eLepHhCwE
    vbaKTPawXBv4-4DrA>
X-ME-Received: <xmr:7-bBZ927jNOpUYgEfK2bqMu5V19_wpSpsEvbcnOtN89PeLsbHGpCc6zeBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdeltdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepffdtiefhieegtddvueeuffeiteevtdegjeeu
    hffhgfdugfefgefgfedtieeghedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhn
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejje
    ekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhn
    rghmvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehkvghnthdrohhvvghrshhtrhgvvghtsehlihhnuhigrdguvghvpdhrtghpthhtohep
    phhoshhtsehrrghlfhhjrdguvgdprhgtphhtthhopegurghvihgurdhlrghighhhthdrlh
    hinhhugiesghhmrghilhdrtghomhdprhgtphhtthhopehrohhsthgvughtsehgohhoughm
    ihhsrdhorhhgpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurg
    htihhonhdrohhrghdprhgtphhtthhopehuvggtkhgvrhesthhughhrrgiirdgrthdprhgt
    phhtthhopehprghulhhmtghksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitg
    gvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehvvghnthhurhgrjhgrtghk
    keehsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:7-bBZ0D3U54kKzCEWiPzoIexvect_geKeQc8jQiTq6NB-IebEYrBgg>
    <xmx:7-bBZ5iKJ4XACsTsJX2fNigsxPEGZMjrhfXhM5axtLkkPoLeYEZIFQ>
    <xmx:7-bBZwovYU0HAnXUnLMEfEMrFEoWaML0jmNC1tdsDnahH4hUjjsbjA>
    <xmx:7-bBZ8iUeb504khlvXJEJ6HffL09c-4gdrpSPgb3KautgpaG0uqYkQ>
    <xmx:7-bBZwTWgPZHaSnmSERlEwFUtMG3DtZRmZ5VB7QErBOUC-RZja4LX0IA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Feb 2025 11:40:14 -0500 (EST)
Date: Fri, 28 Feb 2025 08:40:13 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Ralf Jung <post@ralfj.de>, David Laight <david.laight.linux@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Martin Uecker <uecker@tugraz.at>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>,
	airlied@gmail.com, ej@inai.de, gregkh@linuxfoundation.org,
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
	rust-for-linux@vger.kernel.org
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <Z8Hm7ROXFwQ5ER76@Mac.home>
References: <20250226171321.714f3b75@gandalf.local.home>
 <CAHk-=wj8Btsn0zN5jT1nBsUskF8DJoZbMiK81i_wPBk82Z0MGw@mail.gmail.com>
 <20250226173534.44b42190@gandalf.local.home>
 <20250227204722.653ce86b@pumpkin>
 <07acc636-75d9-4e4b-9e99-9a784d88e188@ralfj.de>
 <fbwwitktndx6vpkyhp5znkxmdfpforylvcmimyewel6mett2cw@i5yxaracpso2>
 <Z8HaT4X4ikQzAghu@Mac.home>
 <vvtxa4jjk2wy7q6wnnxxgidopfd3pzxgntuehsu4skex24x5ml@yejfkrtg5dqc>
 <Z8HglTh3EKO63lmu@Mac.home>
 <p4bawegz52nu3v2l25gnj5gh34patcxeggcdbom327wh3dhxyq@cp735olb55ps>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p4bawegz52nu3v2l25gnj5gh34patcxeggcdbom327wh3dhxyq@cp735olb55ps>

On Fri, Feb 28, 2025 at 11:21:47AM -0500, Kent Overstreet wrote:
> On Fri, Feb 28, 2025 at 08:13:09AM -0800, Boqun Feng wrote:
> > On Fri, Feb 28, 2025 at 11:04:28AM -0500, Kent Overstreet wrote:
> > > On Fri, Feb 28, 2025 at 07:46:23AM -0800, Boqun Feng wrote:
> > > > On Fri, Feb 28, 2025 at 10:41:12AM -0500, Kent Overstreet wrote:
> > > > > On Fri, Feb 28, 2025 at 08:44:58AM +0100, Ralf Jung wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > > > I guess you can sum this up to:
> > > > > > > > 
> > > > > > > >    The compiler should never assume it's safe to read a global more than the
> > > > > > > >    code specifies, but if the code reads a global more than once, it's fine
> > > > > > > >    to cache the multiple reads.
> > > > > > > > 
> > > > > > > > Same for writes, but I find WRITE_ONCE() used less often than READ_ONCE().
> > > > > > > > And when I do use it, it is more to prevent write tearing as you mentioned.
> > > > > > > 
> > > > > > > Except that (IIRC) it is actually valid for the compiler to write something
> > > > > > > entirely unrelated to a memory location before writing the expected value.
> > > > > > > (eg use it instead of stack for a register spill+reload.)
> > > > > > > Not gcc doesn't do that - but the standard lets it do it.
> > > > > > 
> > > > > > Whether the compiler is permitted to do that depends heavily on what exactly
> > > > > > the code looks like, so it's hard to discuss this in the abstract.
> > > > > > If inside some function, *all* writes to a given location are atomic (I
> > > > > > think that's what you call WRITE_ONCE?), then the compiler is *not* allowed
> > > > > > to invent any new writes to that memory. The compiler has to assume that
> > > > > > there might be concurrent reads from other threads, whose behavior could
> > > > > > change from the extra compiler-introduced writes. The spec (in C, C++, and
> > > > > > Rust) already works like that.
> > > > > > 
> > > > > > OTOH, the moment you do a single non-atomic write (i.e., a regular "*ptr =
> > > > > > val;" or memcpy or so), that is a signal to the compiler that there cannot
> > > > > > be any concurrent accesses happening at the moment, and therefore it can
> > > > > > (and likely will) introduce extra writes to that memory.
> > > > > 
> > > > > Is that how it really works?
> > > > > 
> > > > > I'd expect the atomic writes to have what we call "compiler barriers"
> > > > > before and after; IOW, the compiler can do whatever it wants with non
> > > > 
> > > > If the atomic writes are relaxed, they shouldn't have "compiler
> > > > barriers" before or after, e.g. our kernel atomics don't have such
> > > > compiler barriers. And WRITE_ONCE() is basically relaxed atomic writes.
> > > 
> > > Then perhaps we need a better definition of ATOMIC_RELAXED?
> > > 
> > > I've always taken ATOMIC_RELAXED to mean "may be reordered with accesses
> > > to other memory locations". What you're describing seems likely to cause
> > 
> > You lost me on this one. if RELAXED means "reordering are allowed", then
> > why the compiler barriers implied from it?
> 
> yes, compiler barrier is the wrong language here
> 
> > > e.g. if you allocate a struct, memset() it to zero it out, then publish
> > > it, then do a WRITE_ONCE()...
> > 
> > How do you publish it? If you mean:
> > 
> > 	// assume gp == NULL initially.
> > 
> > 	*x = 0;
> > 	smp_store_release(gp, x);
> > 
> > 	WRITE_ONCE(*x, 1);
> > 
> > and the other thread does
> > 
> > 	x = smp_load_acquire(gp);
> > 	if (p) {
> > 		r1 = READ_ONCE(*x);
> > 	}
> > 
> > r1 can be either 0 or 1.
> 
> So if the compiler does obey the store_release barrier, then we're ok.
> 
> IOW, that has to override the "compiler sees the non-atomic store as a
> hint..." - but the thing is, since we're moving more to type system

This might be a bad example, but I think that means if you add another
*x = 2 after WRITE_ONCE(*x, 1):

 	*x = 0;
 	smp_store_release(gp, x);
 
 	WRITE_ONCE(*x, 1);
	*x = 2;

then compilers in-theory can do anything they seems fit. I.e. r1 can be
anything. Because it's a data race.

> described concurrency than helpers, I wonder if that will actually be
> the case.
> 
> Also, what's the situation with reads? Can we end up in a situation
> where a non-atomic read causes the compiler do erronious things with an
> atomic_load(..., relaxed)?

For LKMM, no, because our data races requires at least one access
being write[1], this applies to both C and Rust. For Rust native memory
model, no, because Ralf fixed it:

	https://github.com/rust-lang/rust/pull/128778

[1]: "PLAIN ACCESSES AND DATA RACES" in tools/memory-model/Documentation/explanation.txt

Regards,
Boqun

