Return-Path: <ksummit+bounces-1876-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3398BA42507
	for <lists@lfdr.de>; Mon, 24 Feb 2025 16:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6032217B4D6
	for <lists@lfdr.de>; Mon, 24 Feb 2025 14:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD04F24EF6C;
	Mon, 24 Feb 2025 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvTiL46c"
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F9A24EF6D
	for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740408868; cv=none; b=h63QL7NZIZaX0/kVd9MQB3HUxd+o9vhjqGIutV4tYJnkemoJE3nHTFtyt8h9uss4uc0EbqaPuXL45WCD9HDCDnDof1kLGXJhxMrXPR7BFX+NmjeAi6ue1PCNFIWV6j9vS8f3gw3GxyTqAZnbECQWomig0ffB0kooltxe81PmsN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740408868; c=relaxed/simple;
	bh=KLul3ZTAtHJe/n3xu+7cwVDZJuShWGTqS305WKdQyAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXRE1Kpp5Ql5kJdDnnuAXGdJLquVGb0iKe4dI8whBiiXMe4e3bB5o2C8Ti6LWMfNPcgDk6tchwYquJ0idA1S1AblL60RlNGs15eUO7gCmIhLGOCDA3p2TnbivU99nxxLocxp86dtqWt/5kyKoC9sEEOv9SDkgDTwe1D4epsijSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvTiL46c; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fe5d75ff8cso106048a91.3
        for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 06:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740408866; x=1741013666; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcJQ2PByz6Lu9IM3XdLufcM/7wqjI4LpjnZF5XQFLRQ=;
        b=bvTiL46csPMiloUfTI9oOEoUmxsky8P3UjvG2P8Fns2tu52zS4ulniIuiOczPUcoq/
         3fX6w0x+aIjGW+XKQjq//QLg07utJ65yLMOMes6LkM4AK7D6uKYeJW/TUY/6e5yLzemH
         5Yur3JkBmGnMYaLjjIIdVweAoORWOgJE/BZFFXeoTC//fZ9S9BzfCFjrPwRKZuki7Hy9
         vnYd6/z1h/rbaYxre5+G8DKfS+/jnTzdLatxmWOjuFDGSBvDKF8hKmkcrwErAZQdtRFD
         25D2Zx3kbQK93LWWzP7GOV47hjpqNJyakbb710KSPNj2l6bVYTP/0/KeV4QQtIVqPlcP
         yvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740408866; x=1741013666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcJQ2PByz6Lu9IM3XdLufcM/7wqjI4LpjnZF5XQFLRQ=;
        b=mPT6Ah1dxTqp8oDKDaZwgweVi1+3m0wUJyTYKfZzcrEvQ0f2GIjZRgTgj+u3TzVOG3
         6BaYGpoB+DYElei7pf//2sXJRDHsSY369oLexfTpW2rZ2ESeyhwjzsl33HyA1P1xiIiK
         +VQsdDoFUwmmDwpI+qXA6ROJO2rUVbe/WOUvvcjiv+lZ0rv023mKxQZStWkfVqIp2NDt
         BnTBx5fZi2gTdtZDKvnEDYqPIWP4ZH5/uhmi/cFvlAyF2rtQn08RhuDE+gwB0cVA/I1M
         MppNqo1VhB50Ttby/EdcJyh72hPsGXN84MymF7Xg+VZ8jWW605SlgfeQ+C/SCfDvXe05
         krUg==
X-Forwarded-Encrypted: i=1; AJvYcCVmAYmyEAElIXKbry5D0DZmEN/PfQi+d0RImzUYAEkBMLM/UaSocVpJd6YiICKKE1fNMj6fHsgu@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt1FELzxxg7/iGV1HQrYXFMk/CCAXie1760U5VP/sHPAPLH2up
	Zz4tD3MtcNEICpFi8xHILh0+bmXR5tsZIM4BVg4pqwH4ZVmw5sD/71+jTJyla+P59uO6Eu1u0GJ
	sf+bmYdT+Z4vEbGdyV5Ejaoov9FI=
X-Gm-Gg: ASbGncv/FqCYuQnd9nqkyBHoYkXzcFv7gxdgJMA3NJXyl3HmWaGvfyNhO3FIbHZzha7
	GBf8YFmjCHGZ9i1Oybx5QS7CUuFxUMsqZuz3lU04ZShDsq496Adx+4cmfM/InfU22lkJipywERh
	Kuvmnkc9A=
X-Google-Smtp-Source: AGHT+IGDjahBUVO6BXevnVMHWjQyKi4BqDRHKTF8y7apvI5jM3Rv1j7RNOMukgd4iq3HaXOneLmH+308oWENkLJBz9E=
X-Received: by 2002:a17:90b:4f85:b0:2f2:f6e5:d28e with SMTP id
 98e67ed59e1d1-2fce7aef8damr8610160a91.3.1740408866030; Mon, 24 Feb 2025
 06:54:26 -0800 (PST)
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
 <20250224125805.GA5729@mit.edu> <CANiq72k-K3-Cbnm=0556sXAWs0kXBCB4oR67M4UtD=fq=kyp7A@mail.gmail.com>
In-Reply-To: <CANiq72k-K3-Cbnm=0556sXAWs0kXBCB4oR67M4UtD=fq=kyp7A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Feb 2025 15:54:12 +0100
X-Gm-Features: AWEUYZmiNFSazSTTuGNZbCDwsIIxYoIgz2rLtYlFv5_7wXS0fxYpgaGNrAtv5_E
Message-ID: <CANiq72mfQk_ViHJ9Y_rU0etS8XpORvZUNMc5m2iHL=pQDiVFSg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Ventura Jack <venturajack85@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Ralf Jung <post@ralfj.de>, 
	Antoni Boucher <bouanto@zoho.com>, Arthur Cohen <arthur.cohen@embecosm.com>, 
	Philip Herron <herron.philip@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 3:47=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Feb 24, 2025 at 1:58=E2=80=AFPM Theodore Ts'o <tytso@mit.edu> wro=
te:
> >
> > Hmm, I wonder if this is the reason of the persistent hostility that I
> > keep hearing about in the Rust community against alternate
> > implementations of the Rust compiler, such as the one being developed
> > using the GCC backend.  *Since* the aliasing model hasn't been
>
> I guess you are referring to gccrs, i.e. the new GCC frontend
> developed within GCC (the other one, which is a backend,
> rustc_codegen_gcc, is part of the Rust project, so no hostility there
> I assume).
>
> In any case, yes, there are some people out there that may not agree
> with the benefits/costs of implementing a new frontend in, say, GCC.
> But that does not imply everyone is hostile. In fact, as far as I
> understand, both Rust and gccrs are working together, e.g. see this
> recent blog post:
>
>     https://blog.rust-lang.org/2024/11/07/gccrs-an-alternative-compiler-f=
or-rust.html

Cc'ing Antoni, Arthur and Philip, in case they want to add, clarify
and/or correct me.

Cheers,
Miguel

