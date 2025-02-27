Return-Path: <ksummit+bounces-1976-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BDFA4702F
	for <lists@lfdr.de>; Thu, 27 Feb 2025 01:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 992DF188C748
	for <lists@lfdr.de>; Thu, 27 Feb 2025 00:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D314A35;
	Thu, 27 Feb 2025 00:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iysYO9aI"
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A12E27004B
	for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 00:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740615976; cv=none; b=b4U+L9cDf60bE0DcR5JGBmJhIsTUljyWaBHmhip96GJTTloaSOOwuewOvgTtHqt53qDSFkXCY/6WmgsgzeiXuY3ZQvSRYoJ5j5N/LIZIfRSYHDNZlY9OL9L+vaDyJwxIcmPTFldSfviYTatxsB5gnbHL+b28bV4kt9WoiaCp/z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740615976; c=relaxed/simple;
	bh=bYSdQFw1ifj/PHNEy9onf1+iaxoTCsepzzcH95uH2Os=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=SzuBblsiicB7YSy9Df3pypQaxv+HsgKqB7BVmOl0LJ+nb004atoPfrjjtJFUgMbgCPGRQOMnBPtgbiwoEEF40ZXjiuOFFLVlg0/y02uDTEtdM66pBzZ9pDEAetL4KK3ISG1OCL9pP3kNQpkuWL4u2/Su9jv5rUidJze4mbGGuAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iysYO9aI; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22328dca22fso4569845ad.1
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 16:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740615975; x=1741220775; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjzP/rJRMjLSGPUq68ittLipJnIhlpcB171jTse6kDE=;
        b=iysYO9aIOgiJA5JmdljaWDfmUDO1fJdb9cK+GZnPBmw2aR6142Mk9jRwaDxSWmW5Gj
         0oLEcVFPJG/0ww2Eq3y1AfGfld2N/xy5onNKz20518+58EZQZ/EcSVi75xvYctLl8Tpf
         sz440pac2xzBkXnv3SWCAT9mC1hefeS6VUyaVK1coWCS5MQ//GoiBwko1m3pR13TNXGd
         GOnvm+HR+foB/TpvzSLtvegvZJlt80NlM9UbyYhe0h4d3M0du/d4OLKiOqrhg9DnRQwW
         UO1Y29WFqOJIGXcFOzm6g8EYLHo3FW0B3V5a8zO4tCI+AMqoh4NOFl+iRlGmdy8UZvXH
         Md0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740615975; x=1741220775;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjzP/rJRMjLSGPUq68ittLipJnIhlpcB171jTse6kDE=;
        b=dZ3g7M+N7UnRxpScTmW46HIpwsjZSoUeHOfWkWQMoVoqN5RVotk5aFvvN9wt/P21t8
         k+NugnNE0Ov9seujxgtHTNZiv0PAsnhppuff4gjN5yRH/zlUnpeLhrtN2p7qt67DMZsK
         82ayK0kfdRsRotZrF+g0zIZO3PUO+Nrk3pbnJJDarFr061eMKteaOIE8b5UcMDmDiXeg
         05afR8pIGsowaQ7ITgqXBJLVZKkSNBqVZnsV7fDUtDB0i6REke4R7yVdLRTMgSSUtujO
         NwDWtJKuai7bvMTFoy71TEjPUdMnzJrKCv4ZVAZT5a02Me+lq6Ky0kKP+paJOa4HArvO
         GATQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9gSNSwl4hpbzyNr/uL5shiSJvOwR7ANNK9MgeGDmfJMTyX9KFOQiFUnLTgW9Y/m3XaFBOJZ8m@lists.linux.dev
X-Gm-Message-State: AOJu0YwlmOUQvjh1dR4eHMzK/ktUeXHNxUx7y0hQrRDeVQhLX/vnqat2
	EP1U13BXNNJPqdo1fYpZqXfRyelCS20a2OkH3N5mpCG1P7Dvc9JM
X-Gm-Gg: ASbGncsSH06/V6moX8E2JRNVtBix2lx0iFIkB+riqDH9d/bXmwPTIVRqce8yEmq9BN8
	+wTsWkafIuOUZPY/KCkutZPZPsTtbZMBFfZO3h/nJF44D5od0rnJvjkQOzBph14siTH/RdvM1Ld
	b7wMOykCI/KrT9OzW5WvcUHr/NwUthisu+mlU69KQan41ySf/r2O1aAfbiA93Sh5BQOjXIEsVgC
	OWcJPA5ZAcVQ+boiBlSX4rI5vGkgCgwz0GlaM0Nbc7V5ba7MauGN7zLe6B0csitMTr+DNNHDRNG
	qPGm+ZKgS52Jb97DMI6N1uDGApK10ZOJe2RHmzuzfbVZBvA=
X-Google-Smtp-Source: AGHT+IGIR7ac5DaXTj+aXnGj6+y5CDcGjRUX9/M/CBvX/ZzTO/lWPWQNq8Mw+fbL/n0dYUk9infhqA==
X-Received: by 2002:a05:6a00:240c:b0:730:8386:6078 with SMTP id d2e1a72fcca58-73478ed55ccmr14531012b3a.0.1740615974654;
        Wed, 26 Feb 2025 16:26:14 -0800 (PST)
Received: from smtpclient.apple ([2601:645:4300:5ca0:8007:c7a6:4742:3f8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a005f77asm188260b3a.173.2025.02.26.16.26.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Feb 2025 16:26:14 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: C aggregate passing (Rust kernel policy)
From: comex <comexk@gmail.com>
In-Reply-To: <CAHk-=whEkEsGHWBMZ17v5=sq1uRe6g-BRHy5xNZK-2JBKRs=_A@mail.gmail.com>
Date: Wed, 26 Feb 2025 16:26:02 -0800
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
 Martin Uecker <uecker@tugraz.at>,
 Ralf Jung <post@ralfj.de>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Ventura Jack <venturajack85@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 airlied@gmail.com,
 boqun.feng@gmail.com,
 david.laight.linux@gmail.com,
 ej@inai.de,
 gregkh@linuxfoundation.org,
 hch@infradead.org,
 hpa@zytor.com,
 ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <33A13F26-546B-4CB9-9A4A-367973397CCA@gmail.com>
References: <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de>
 <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
 <m4cbniqfsr5xpb2m7k53e7plc6he5ioyl2efiiftdmzod56usd@htwdppje6re5>
 <CAHk-=whEkEsGHWBMZ17v5=sq1uRe6g-BRHy5xNZK-2JBKRs=_A@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: Apple Mail (2.3826.400.131.1.6)



> On Feb 26, 2025, at 3:16=E2=80=AFPM, Linus Torvalds =
<torvalds@linux-foundation.org> wrote:
>=20
> On Wed, 26 Feb 2025 at 14:27, Kent Overstreet =
<kent.overstreet@linux.dev> wrote:
>>=20
>> This is another one that's entirely eliminated due to W^X references.
>=20
> Are you saying rust cannot have global flags?

Believe it or not, no, it cannot.

All global variables must be either immutable, atomic, or protected with =
some sort of lock.=20

You can bypass this with unsafe code (UnsafeCell), but then you need to =
ensure no concurrent mutations for yourself, or else you get UB.

For a simple flag, you would probably use an atomic type with relaxed =
loads/stores.  So you get the same load/store instructions as non-atomic =
accesses, but zero optimizations.  And uglier syntax.

Personally I wish Rust had a weaker atomic ordering that did allow some =
optimizations, along with more syntax sugar for atomics.  But in =
practice it=E2=80=99s really not a big deal, since use of mutable =
globals is discouraged in the first place.=

