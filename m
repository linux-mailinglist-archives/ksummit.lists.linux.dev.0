Return-Path: <ksummit+bounces-1998-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB0BA488D3
	for <lists@lfdr.de>; Thu, 27 Feb 2025 20:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45EFB3ABDE7
	for <lists@lfdr.de>; Thu, 27 Feb 2025 19:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF94926F47C;
	Thu, 27 Feb 2025 19:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ND5V2Ksq"
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D37F26E97D
	for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 19:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740683779; cv=none; b=HmquQxXrNuVJFLj7gHEe52WCOPAgxT3iPQkP95gZV1qatljTCBodtOiUL7ZjDx5NuzviZjBnGVjKJyLfUR+jeAuMQM5vqBdqe8wZOtcJoQmLHKzNjuiIK+pZiRuXKOnuOpaqUfZSZ9JuJ/u5hCmaVgNBU1yRTCeUJ4S/nOt3tdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740683779; c=relaxed/simple;
	bh=mwTHVN620TX5ESULnZIeej/5etZx+q0PaqdGdgEQqhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cjYl8+tEKoT/K+GrD/0TlRd+zeV7J59RWc08RjkJcu4r7o5SucM9661ptmVFUwhe5LLMPlX3APZ0VDwwnb9eDFch08ugprXyeVDHc5FhvOzM2DjKVu3Z1Vo5yoJBKICsli8Xds8O2Xfcj8t7vMBZNmUT2sBJboLK3CEfTQffVEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ND5V2Ksq; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abec8c122e4so193361366b.1
        for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 11:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740683775; x=1741288575; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hvB+JZlfkgHPFuQYjc4Ck/8suSwxp4Qhz+OIGbF3Mns=;
        b=ND5V2Ksq3JnbipHtiuDrwRiJfoonDuAbeL19ro4QFYOVNZdhKbSF+d6BJm2ymVgIzn
         tisonLE/mi0lmSaIcfGvOsgIP6IlWg85wAAfUnNytphJFcLVRUpjZgx/NZ2mKWpHgfxw
         1aJkaaFq/fznofRH8xtkSiGrZIRVOWVsRQMwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740683775; x=1741288575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvB+JZlfkgHPFuQYjc4Ck/8suSwxp4Qhz+OIGbF3Mns=;
        b=FnNsA6BOZ3lRnsm55heG6POVAf7Rmtc1aheToHlpm0lrIrlN/4MURHN6C5w156prGh
         0VJ3ITy0fhLgdtRbSllbAG6bmj1VOHbCX0VySlVstiY2Om0ySe63FP6c7U3MTgX24ME6
         myLqiX268DRvhfg5AswF5ysKE3yIeSo4mlpYl834GBo/l/46wDv4sMjI9X67KqVYcSIH
         FedjcsBIDee2DG8Mrn2bxAMwfZUv7kl9fTOxMEJiFjH5T9m12SS4DJxBpu2W65cyKaVy
         Cc4nF2YKoAFxKKavI/3Gx7u9/ff3gFTm56bwxmx2advxC+2fjOM/AyYRX7HMmdQbcrqE
         Nqtw==
X-Forwarded-Encrypted: i=1; AJvYcCVVXI+Hx7fD+6zkT+VDOYR1F6BKlp14CF1zJY+ptKES3uVtS5QKrbQ27hc6zbpG7mILATzszFuO@lists.linux.dev
X-Gm-Message-State: AOJu0Ywkc6CQCNgAEhs08AXp61UKBkDZiEoQzodFwbBgENgESJUAjfOe
	GKXlRVmYAEEnPnqq1KkDb/7mtiR+cppubigOSwJvf88sl9y1o3qsOgZmxB6O5BNXyswfrnwMsUn
	po+uIAQ==
X-Gm-Gg: ASbGncsuRYej11iI5KKVG/8OVWW6lqCklBEL3VAUKZ3wzqn3As03KdZNmIRNIWDU7OG
	KE1GPCQp4CJK85oSiK6bWAdcg+TVGYWSVrLFZCPvn2cx8nwfzid4y5FQRHRyP+8pw/3CtdnUELG
	d+qpLCUK9LeJsB3o1vtffgE404VsnAO4JlYeBF5EIiqfv6OiCp2+3WtszAxOEMmfyv/Qx2PFuw9
	7VG/qhH5RM6r0MLI2pZ71+nnIXIfRmhMcUXksDQ9EobeoItpPJGNCPRdxx9bE38C1QLnaNDJR3q
	lMxadEEGFya1w9ayexlg+QN9/e9gSi67sLjI2Ypj/9cGICJZGUFpSVGBJpXzDdX7oz4oeH0mcCH
	N
X-Google-Smtp-Source: AGHT+IHU6R44XXOuQhXsYkaHCgKICNriCTMLMEmEzmOeC4lsQdKrSmIUC35KttadVBT1xuGNprSaYA==
X-Received: by 2002:a17:907:d92:b0:abf:692:40bd with SMTP id a640c23a62f3a-abf265a30bfmr57082566b.43.1740683775109;
        Thu, 27 Feb 2025 11:16:15 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c7bbfb5sm167589666b.170.2025.02.27.11.16.11
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 11:16:11 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abb7520028bso170514066b.3
        for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 11:16:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAOd9dzOlwXay5cUuz33dVqmvRj4f+lMqAA+WcbQYvVJLH36IikDXSgskU69jUSTrAF/RW3Fpe@lists.linux.dev
X-Received: by 2002:a17:907:86ac:b0:ab6:df79:f577 with SMTP id
 a640c23a62f3a-abf25d945c1mr67115866b.9.1740683771357; Thu, 27 Feb 2025
 11:16:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
 <m4cbniqfsr5xpb2m7k53e7plc6he5ioyl2efiiftdmzod56usd@htwdppje6re5>
 <CAHk-=whEkEsGHWBMZ17v5=sq1uRe6g-BRHy5xNZK-2JBKRs=_A@mail.gmail.com> <0f3bc0e8-5111-4e2f-83b5-36b3aec0cbbd@ralfj.de>
In-Reply-To: <0f3bc0e8-5111-4e2f-83b5-36b3aec0cbbd@ralfj.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Feb 2025 11:15:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj37zT4Fy+mBFVRKPy=NMKcB6xBzqOuFrW0jOTv8LKozg@mail.gmail.com>
X-Gm-Features: AQ5f1Jptz1SWwyUusZnRoigWvZHElhRRDe0KZ_mwrHUSOFHPo4sqdKCJh4Qdo6A
Message-ID: <CAHk-=wj37zT4Fy+mBFVRKPy=NMKcB6xBzqOuFrW0jOTv8LKozg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ralf Jung <post@ralfj.de>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Martin Uecker <uecker@tugraz.at>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Feb 2025 at 10:33, Ralf Jung <post@ralfj.de> wrote:
>
> The way you do global flags in Rust is like this:

Note that I was really talking mainly about the unsafe cases, an din
particular when interfacing with C code.

Also, honestly:

> FLAG.store(true, Ordering::SeqCst); // or release/acquire/relaxed

I suspect in reality it would be hidden as accessor functions, or
people just continue to write things in C.

Yes, I know all about the C++ memory ordering. It's not only a
standards mess, it's all very illegible code too.

             Linus

