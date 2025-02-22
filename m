Return-Path: <ksummit+bounces-1852-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 152D7A40BD3
	for <lists@lfdr.de>; Sat, 22 Feb 2025 23:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 717B47A855C
	for <lists@lfdr.de>; Sat, 22 Feb 2025 22:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7322045B7;
	Sat, 22 Feb 2025 22:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnMpJdWy"
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9937620013A
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 22:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740262376; cv=none; b=QB5wGOaQTpmi9+GuUPUCVMJZ2zciZM0wFJIadimJxFQhOPIAJgjmcvv/tES4K50ygO7m6qPyrjftsmUKGU2cSE0GsZE3x+oxVx7oyrlrqVGO+hxoTU6r1P+ppTt8pZLphQ7HXAJZanaOBxq240u627/ohSliHHsaZwu5iWp6bOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740262376; c=relaxed/simple;
	bh=0kVZChQIdT05i2ugJJnK3LxJC0uLV6WBEoEYYYnfB0A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BH1adHY8izptFZRO+bxhsCTI1rrhY61TUyQ39Btk7UTKAatrrJMwNPNr7b7PdtxLjBOanuTZPUeemuFKQKFcWMnX8pqfxW7orAbgocDdHSdpsrjnRk+XWDAtcpvAmyd3bYIm28SfXFjVyMkfWlEYH114K89TN9kwBaZCh+VfvlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnMpJdWy; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1646024f8f.3
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 14:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740262373; x=1740867173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XocSJp5y9VHtgpY1Xznfpqr9ru+r8Xd3NaR0HKrcKs=;
        b=UnMpJdWyR43ADyt9VSZAbSn5JQDNvA/4cMCuZZRAD0VO4WhmNDD1SghVLxc5uQbZzU
         vTTxq7fBSyZdvxetVXXxFj377/cw0vU6df30vQAcGllbvpUVKszUjY+Elgqft8u+EeT4
         rh/R5If6URnB3220drL0IxYIUar2Ud/jHDHDk3m1/aBy6Wu8NWyvO+mArzJSglDQxVw/
         ughFfb8FTRMeXhy2KlYnx3engHR6NwM3d5u2d+IThID0vHOfNghJ8rfVjND8JzyCCIju
         x+mlKbZJ7prkDBX0T3pyXG7OlO4+fzvr9E/qRh/gpAgF+8uppN+J0cikUcTXQPMAPWP5
         YejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740262373; x=1740867173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XocSJp5y9VHtgpY1Xznfpqr9ru+r8Xd3NaR0HKrcKs=;
        b=qvl7sLeMywcro61xaTf5OfCPCtnYI3GSQPH+pKEHBl9bZLNBxB9HqPwcSGHZTovtzQ
         lqZ+RF+TDJJEjWQCrwfqkropSzfWsz6KcHbEaKGYPApm5Myi69kTYReAAs7Mb9vhUM5j
         847t6Z8yP5kObenl6SI3PaMIVuttCT5N7kfC88LZ15FNUvxvcq3QOSvH59pRrOWh9N1o
         LWp8jKoKop1XcfEST3ZZkXM1q5AuZa0nzCRvWnuE2T38LKOav1a8ymEQTiUVLoVCEaxr
         3Pa/s0IoZSbf2cbKsbwUyc6aQhTfnRMIl4RzxEFA+jdhBI9zmmvsU/6XJunl/phJ/Ilj
         kaDw==
X-Forwarded-Encrypted: i=1; AJvYcCUhEfUGXJhB1JA7P4d0H1H0G8JKdjOk79Xj1iMazSPHl5f70gqgkyhFuTHL0IDz+4iOUu0XC+rJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyU75QY0DXRRiyhbuUnGz8ETUSl651DQGC5VN63Tp0VV3g6plTv
	BS8Cz1jS3fMiBusOpCuMmFDgFFQtIOuC+NJ4CdFl2t95WboLdve/
X-Gm-Gg: ASbGnctkMhKnk+z3n9A9XsP+8u0HuwYTedAE4QjerN9IHo3HZP7/u43YU/4S427Q5wW
	gvBRz12cn6b3hCI1Ed9ztg2aD0L1HjKoXFMsvGJmJDQs3OksitnYXygPonF5CJbxK5ptNaEMfcy
	mMwws2+9U50+/Q5Zjzca5ARzLyurax4vcxwBFng8o3MkfwQoSspW6O7+qgUgIwvJsERV0w4Ja4h
	lfQSWj1Od9IdyoE5QWLNb3MYFZ+gzHFX25lS9D8/F/I+8+MIMxtEmCcLfQNqslgzTkkDJ2jbJtR
	QNuIlLmVP51x6lRfCxrnBb2EFxg8yfAW3DnK7/NorlEocRHvLLczJkhi+aUnTtdG
X-Google-Smtp-Source: AGHT+IH++ps/T2w03Bu4CN8he1k98DEeg+N3rfDsfaT/b0Jrqdk/zL6D2AMk8zqDe8Q6Vd2lstNpbQ==
X-Received: by 2002:a05:6000:144a:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-38f6e7587c5mr6985640f8f.9.1740262372632;
        Sat, 22 Feb 2025 14:12:52 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4314sm27002426f8f.9.2025.02.22.14.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 14:12:52 -0800 (PST)
Date: Sat, 22 Feb 2025 22:12:48 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Ventura Jack <venturajack85@gmail.com>,
 Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com,
 ej@inai.de, gregkh@linuxfoundation.org, hch@infradead.org,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <20250222221248.772b4bf6@pumpkin>
In-Reply-To: <c3spwcoq7j4fx5yg4l7njeiofhkaasbknze3byh4dl45yeacvr@rb6u6j5kz7oe>
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
	<20250222141521.1fe24871@eugeo>
	<CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
	<6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
	<CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
	<yuwkqfbunlymofpd4kpqmzpiwbxxxupyj57tl5hblf7vsvebhm@ljz6u26eg5ft>
	<6EFFB41B-9145-496E-8217-07AF404BE695@zytor.com>
	<c3spwcoq7j4fx5yg4l7njeiofhkaasbknze3byh4dl45yeacvr@rb6u6j5kz7oe>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Feb 2025 16:22:08 -0500
Kent Overstreet <kent.overstreet@linux.dev> wrote:

> On Sat, Feb 22, 2025 at 12:54:31PM -0800, H. Peter Anvin wrote:
> > VLIW and OoO might seem orthogonal, but they aren't =E2=80=93 because t=
hey are
> > trying to solve the same problem, combining them either means the OoO
> > engine can't do a very good job because of false dependencies (if you
> > are scheduling molecules) or you have to break them instructions down
> > into atoms, at which point it is just a (often quite inefficient) RISC
> > encoding. In short, VLIW *might* make sense when you are statically
> > scheduling a known pipeline, but it is basically a dead end for
> > evolution =E2=80=93 so unless you can JIT your code for each new chip
> > generation... =20
>=20
> JITing for each chip generation would be a part of any serious new VLIW
> effort. It's plenty doable in the open source world and the gains are
> too big to ignore.

Doesn't most code get 'dumbed down' to whatever 'normal' ABI compilers
can easily handle.
A few hot loops might get optimised, but most code won't be.
Of course AI/GPU code is going to spend a lot of time in some tight loops.
But no one is going to go through the TCP stack and optimise the source
so that a compiler can make a better job of it for 'this years' cpu.

For various reasons ended up writing a simple 32bit cpu last year (in VHDL =
for an fgpa).
The ALU is easy - just a big MUX.
The difficulty is feeding the result of one instruction into the next.
Normal code needs to do that all the time, you can't afford a stall
(never mind the 3 clocks writing to/from the register 'memory' would take).
In fact the ALU dependencies [1] ended up being slower than the instruction=
 fetch
code, so I managed to take predicted and unconditional branches without a s=
tall.
So no point having the 'branch delay slot' of sparc32.
[1] multiply was the issue, even with a pipeline stall if the result has ne=
eded.
In any case it only had to run at 62.5MHz (related to the PCIe speed).

Was definitely an interesting exercise.

	David


