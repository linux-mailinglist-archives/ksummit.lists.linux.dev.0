Return-Path: <ksummit+bounces-1845-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC3CA40B7B
	for <lists@lfdr.de>; Sat, 22 Feb 2025 20:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D375176F3E
	for <lists@lfdr.de>; Sat, 22 Feb 2025 19:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0072046B2;
	Sat, 22 Feb 2025 19:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJJ15WzU"
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F4C201026
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 19:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740253326; cv=none; b=Yw1R8sUdca3Bs9N9HVSiSPhd6Mrr6EqjsvH9G4nRenhjDAM5XRV2cIVVFCA366zISUWymhH2X0Scf+i1X/parU/o/+mYfhW+ckGohd1ftRgZh+SJ8YdkKQkZRSAYsldQd6xc6oUFOaFvbgz6uDJC2WqfSmbe3LXAis/5MC4jT84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740253326; c=relaxed/simple;
	bh=kITtiZ18+LO+sCHEc5eH+N7HF/ZLQrNdJwvZ+WL3fX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Glw+r71ATdKj+hHg1olWVKlrYo8EVD57+SvgJmRkWEZjMvGmpR4NSBawk40zB4E77eSvhnboEKjE5PtE6vo6wlOMcCzr1oQOGcxeuD76EfGvRwpvtRW47wnnpeFVXfGXhw3s+2c9lCkFstsXNFd7UEXIbc9XJmtJ9ZDbs08TNhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJJ15WzU; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fc92215d15so839083a91.1
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 11:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740253324; x=1740858124; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CRvgQmR5ivMD1h4F3gokRfm2MjjJsLjsc4JEynmsAM=;
        b=WJJ15WzUGkXstjQRqxMp3lwVkD/H6BHtigC+BT1xJ7rTNyYy/wms+WFApDjiR2e/D8
         BmJdpd0aEPMzoGTOzNRJDgEParj0Ci87Gwr5npTsjm6zwG/tnmRrtiAg8BzmWwpkqYlO
         I4NGqalcN7O42evTyY+VbBO7mEIRuYhP7nscUYcomwupQDeq4DsEeLLaQIU1I+duc5zN
         2BIAwOys1b4D85yEi1l2fH+pQ47WcRCka5YMU9D19aLdryJl0WeMjl51BIgYhozkRzC5
         Xl/Np+Wbmhyg2u8UtXlGo9HvualunFz9ii4Vf2iAM/cVpama+B8ZdVCPGWnyeq6tKHoo
         lxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740253324; x=1740858124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CRvgQmR5ivMD1h4F3gokRfm2MjjJsLjsc4JEynmsAM=;
        b=Zro8Gtjx4NdD3SamNtLViVnsTuDYFgzoIR12KEAArNGBXCNxzRngvbnni0pYElj5+8
         1bkX06zWGTb167dH0BYgK5gbUzFs5AzatlY5nh9ZeQQQFV6SMT6b+yEScplXVSiHrAqR
         CVWnB2HHHIkrx/E4wYyvdpeTsrt2plZryTFOyFAzCjs/zQsI8mK0qKySofBKreCoJSKL
         7U8Rd0i0kNyWLtX4XQ+ipkfPbekG/1sw3xVhXyMC40FMPhgesz+BsTTNumDUm/2xHgIb
         Y6ozoxqvRPnkiuj1imrRT1Xuwy0iS1Mp+XPxxuwz/He6e87EcxW5cNBAwVY5so8XAYlU
         sLrg==
X-Forwarded-Encrypted: i=1; AJvYcCV7aAZfFDr7BaKQtRtshbqfOPT9GnHqmFfukwF7aauqILMRPnvrkq1UL7BwrMF81QF4NqAWjKLl@lists.linux.dev
X-Gm-Message-State: AOJu0YyrbS152GW6HmNzPqL2d/p4aNMTc72NFFwSvFzq6r1vM7rL2POk
	hPQwch2LCn6HEcvuSoLYWeBPAyglNnvLPMCvr9OZ0+oetZeg2ouquiaU91mMT91ioO28OjF8cp9
	07OR5mBQHS/oQaNcSROEyphc8Nvg=
X-Gm-Gg: ASbGncu4t1swWNMX27gXqmFuliaInHBNkdPs5+tQ3An8RNuaFmTgMRrGUxrjkWgffRS
	i0qtaokyzQWNwBrKqlKgq/yQ9hfZk3RS4Pv4CNSEj0LTGJXx9cOuuZp08SPoLzJgFFStoADeY2G
	vZ87jGnhs=
X-Google-Smtp-Source: AGHT+IFgZq6EtapkL/u2tRyEnlmt3/Ly4MJg608kxKvNn8pDExIg8vwxtxcox28h6NSfSKflN7BU/IAH6EaBRdtBdDc=
X-Received: by 2002:a17:90b:3907:b0:2fc:f63:4b6a with SMTP id
 98e67ed59e1d1-2fce75f086bmr4985795a91.0.1740253324455; Sat, 22 Feb 2025
 11:42:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
In-Reply-To: <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 22 Feb 2025 20:41:52 +0100
X-Gm-Features: AWEUYZlCk95OYeQYgvv-2CpvGrLCm3JCYmLm7qyKFLs0_jdzIIGhbSshJZkxX-8
Message-ID: <CANiq72mdzUJocjXhPRQEEdgRXsr+TEMt99V5-9R7TjKB7Dtfaw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, 
	torvalds@linux-foundation.org, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Ralf Jung <post@ralfj.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2025 at 7:54=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> I believe (Miguel was talking about this at one of the conferences,
> maybe he'll chime in) that there was work in progress to solidify the
> aliasing and ownership rules at the unsafe level, but it sounded like it
> may have still been an area of research.

Not sure what I said, but Cc'ing Ralf in case he has time and wants to
share something on this (thanks in advance!).

From a quick look, Tree Borrows was submitted for publication back in Novem=
ber:

    https://jhostert.de/assets/pdf/papers/villani2024trees.pdf
    https://perso.crans.org/vanille/treebor/

Cheers,
Miguel

