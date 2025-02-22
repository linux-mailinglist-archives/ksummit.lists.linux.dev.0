Return-Path: <ksummit+bounces-1819-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 161F4A405BD
	for <lists@lfdr.de>; Sat, 22 Feb 2025 06:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE90642595A
	for <lists@lfdr.de>; Sat, 22 Feb 2025 05:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B23220010A;
	Sat, 22 Feb 2025 05:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gj8s0Xtq"
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350F617C2
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 05:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740203798; cv=none; b=RslFYAPRu2U0OF4/KWKwdBXwwlyw5Pp7jSoii+JgP+a8QhDc4L3uqR8nwyfOvJfOE6DNVxC6qVZlTd5IMI+ZCU9HOzi44kmKPf4QF4M1M5wmxNbJp70kEQYEeXpfcV/UtrSiKqrqTIc9YZ0J273zRTQyr5fR1kbsn3lJKzVqb68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740203798; c=relaxed/simple;
	bh=C+stmj8U4y5ym21F+sMcdLbl+U7vfbBp14zzEbI48W4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=D/wVCqcJPc8d9a1RP4XmbdqTcTtAKm4wDThjGfmN+GXhGsDo+0mGYdZEm0Nq5CNqahOEqvlnze4VRFSCY+yd+BRxETP8xW5ERnCGmm+8HXJrB46/6Fxa5xs9jzGYQDkTi8op6zNZv/OHD/Y3rVWZ8W/mKTSgCMayRcOSUYlnPIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gj8s0Xtq; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220d132f16dso45168565ad.0
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 21:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740203796; x=1740808596; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9toe4jz2yTh5fR2DruBYvXF93WBq57gFVoRlebFiqAk=;
        b=Gj8s0Xtqh0kmIICywvA12kr6ixJl2sJls4753cMoFrnXmiBEWXIadV+dlCcHfNrTbR
         WdSlW84Fi3iTyW7Jv9p0PXNE7cCCie7apFMz1N/+Ey3fsXvC/sq+7FnZ6qFsEh7Jc/u9
         O2IxWIqn6ZStEfKzFxUKfaQNaOjgIL0wjo0DOs9ejju56x/ML4eZ+UcpFCrhcj5A0whR
         bgxQqbFLuvV14VBDTU2gA/tx4SGIXlV8dFEOKXQkigI1VeSrL01S6L6SGwOU7rPiQ8oW
         qMV9GxzFEhjQ/nfH+0SMi2CWy0GFuZSNfbnem2hyJzf20P3zGNG9ukNFn7nZQfVhbqSK
         Sy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740203796; x=1740808596;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9toe4jz2yTh5fR2DruBYvXF93WBq57gFVoRlebFiqAk=;
        b=E75iMyxmApA7RDlsUmSZXaVrLVwDidmrp5Awzx0zJNCWvu8iVpsegAZXe4UkmYDXXb
         JjC/bXadhtvZZq1CXNz29qYRatvz9GdUGiwCNtLZjA4HZ8PuOg/t3b+M+YUy2cyCoEAR
         Nv29sWsXxTP1HYLJnlEixdZ9zcfR8MtxU2vtzjaebBMohkZ6HxWG23Ie/iMiL/sSHMIB
         cC9PxGRsDUhRk2clbg92porjokuDlvvj1Po4T1eZ84XR1IL/vBpAPehB/C6AsIUHj0dd
         W3XYnG3x2KJ/9DtjIqGs1pAsLTFtX4k/Saj+CaL6of9UUj6ymZGakimx7g+YAO4UfzQw
         Me5w==
X-Forwarded-Encrypted: i=1; AJvYcCVPsXp0JGLK1wIOxKcebqoukfRW9i0j9u1QPyLY2AUK99kBh80wPqueXanHb8sX4znCC11jDPoW@lists.linux.dev
X-Gm-Message-State: AOJu0YxgNTvlNi9O5r4XwNhKbtxZ0GClYDDTT3S64oPY6c8CzdtVEBy+
	RWSc2ry36M8p5A0ACjv2T8UhZBMLjdQkU7Ef5uS6Y6mw5muboR4c
X-Gm-Gg: ASbGnctw+nGuUOI2GThh4Jd6TPIyFyxPkRCrVjPzml68YWW7u98pYOPsg7VidA0n9j3
	y9uZcv2IMTmz/2h4WNAEuHOCVhKFU3Sor+BNVPmgB0C+Zwk2LvM+zxvjPpH6D+F7wbXSlbo/s2I
	6VziL/95I+jk8lLR7b3a0xU2n3wRjAxYwkfk/qk3ckJzaYzVuZi6FjVIUwIELqj8fXnJQfGoyJr
	Bu0cVHq30vkCuY1lBwG/eZ4HeJysMgK8bmJCH6yCFnyYnWS1uZq2J1VedRPaLwfOFlVQJvCRjoI
	QBHbMYLjqfZpyheUyAoiylFmTOiAZ0a8buofw6+j6DFo2mnr
X-Google-Smtp-Source: AGHT+IE4NzvtvNaLq+BC50x7+IEs35DdLd3D1KdoFJPlnLEPZKxkTfB0OERGN6Dm5auQQeaXxUuQrQ==
X-Received: by 2002:a17:902:d4cf:b0:21d:cd54:c7ef with SMTP id d9443c01a7336-2219ff31902mr88562285ad.9.1740203796361;
        Fri, 21 Feb 2025 21:56:36 -0800 (PST)
Received: from smtpclient.apple ([2601:645:4300:5ca0:35f7:b1dc:26f7:f292])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d536439bsm145851455ad.81.2025.02.21.21.56.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Feb 2025 21:56:35 -0800 (PST)
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
In-Reply-To: <917f49a5-dae4-4810-8116-9bc93ddcd9f5@acm.org>
Date: Fri, 21 Feb 2025 21:56:24 -0800
Cc: David Laight <david.laight.linux@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jan Engelhardt <ej@inai.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org,
 ksummit@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <57A4AE10-546F-402D-A04E-3EC323A86AC5@gmail.com>
References: <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh>
 <2nn05osp-9538-11n6-5650-p87s31pnnqn0@vanv.qr>
 <2025022052-ferment-vice-a30b@gregkh>
 <9B01858A-7EBD-4570-AC51-3F66B2B1E868@zytor.com>
 <n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr>
 <20250221183437.1e2b5b94@pumpkin>
 <p7946077-rn30-n3p3-ppp0-80o9n9p07718@vanv.qr>
 <20250221202332.GA6576@pendragon.ideasonboard.com>
 <20250221220201.7068dfa3@pumpkin>
 <917f49a5-dae4-4810-8116-9bc93ddcd9f5@acm.org>
To: Bart Van Assche <bvanassche@acm.org>
X-Mailer: Apple Mail (2.3826.400.131.1.6)



> On Feb 21, 2025, at 2:13=E2=80=AFPM, Bart Van Assche =
<bvanassche@acm.org> wrote:
>=20
> Initially, early implementations of std::string may have used CoW or =
reference counting techniques.

More accurately, you can=E2=80=99t have one without the other.  =
std::string is mutable, so reference counting requires copy-on-write =
(and of course copy-on-write wouldn=E2=80=99t make sense without =
multiple references).

> Notably, the C++11 standard explicitly banned CoW for std::string in =
order to avoid its pitfalls.
> [ ... ]

The C++11 spec doesn=E2=80=99t explicitly say =E2=80=98thou shalt not =
copy-on-write=E2=80=99, but it requires std::string's operator[] to be =
O(1), which effectively bans it because copying is O(n).

Which forced libstdc++ to break their ABI, since they were using =
copy-on-write before.=

