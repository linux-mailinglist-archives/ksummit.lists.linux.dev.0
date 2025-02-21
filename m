Return-Path: <ksummit+bounces-1804-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C0FA40066
	for <lists@lfdr.de>; Fri, 21 Feb 2025 21:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 739F019C441C
	for <lists@lfdr.de>; Fri, 21 Feb 2025 20:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED26F25335B;
	Fri, 21 Feb 2025 20:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/lwTIjX"
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCA545948
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 20:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740168453; cv=none; b=RAveQjsi/iGfK83B6KVK7MQEX3ghbHE6COnUXf8HngEwXgJ1Sn8pzjFnI7UeXtCh6npbCXqxRvGUkzk6Ni6V3AUC6+uMGllhrMT6umu0tyzFLxANgsgo9vfvi2Thsf3dTJTkhFZs9eFqUR8CBeeHnWoaBuq9yFVWYK4XO+MTbbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740168453; c=relaxed/simple;
	bh=J8i3DZmAPGrWlElVvpG1UCxEbqCR2ykVCXYwjltceaQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WGxLt6oWk23bohDvOnTynm1Sz0wRyCS6aeKqX4kySI7lr+dioazOeifoyVuYUg03f+YsYjlaaFxWgVXMVlbca2FcP5NgXngfF/Hubv+niZ92nLjhft0zJw9j6QvviguqdHGXAJgKimieUTy9HBi7XEqf0DBLQs74q7lLHZtNzM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/lwTIjX; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-221057b6ac4so49596585ad.2
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 12:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740168450; x=1740773250; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RB1lR+aB2DFBicW90ROYujqbV0AEbnFQJOUJctGhXRI=;
        b=N/lwTIjX1sN0mVeewjrtW6o64LzUhjj+yl7db6Mjy2N2/HrxBmeD9tGXzwQdOdH0TZ
         WB6VL3IhpBYLDIlRtdA2ZVSCh0TexvKsmaXFodbWb2nLU71nJ2AqFj3uhjnDMxuBHP5L
         eScjatbHpDtaRp0sr3KvhwJ7ZzktQfCQRMNkQGAfEAqUehm6b72qs+huulZWeAY7sxc5
         PVfBkOc3GLKndT9KhTz2IkCdTF9Cj2TbzwHqeD+bWFV01bP27vv1P2Ya2tQwp2PjBel0
         /tjZ94q9jLruzfleRB2r343Bt0n+ZrSGlTbaHNzdd5zgbtXRNewApV2KGyNnXszEem95
         c90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740168450; x=1740773250;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RB1lR+aB2DFBicW90ROYujqbV0AEbnFQJOUJctGhXRI=;
        b=cdJM5Z94eTgp+/5LUeL+pwquBrw3QSM5+J8Er5/oz6D+z7ndqjXeNFPOVFey5bJ6dm
         S6jlpwcbxVgAdIJilHAHmPB15ZOMc0A8KJj+HOIFIPajw7z1CpchBJpKr+iGwAAd/R65
         fhKpG/D9cfIfBCCXb+6vn1r9+Ut//CurF8r1hdPRknmJK9U3I/ABwG8tc0BIBXfPCoAa
         Gs5U2A+TpfgSEyPb23kALl6BvyGCLkF9xz1OUCqe1EFE1Z3JleI9OMFAZud9TIy9hMAc
         YCqgwiAcR8QNS+tUnf217XSRe+JfIcfuPJIkuxU8vow9H/CjKszjrUmslnAWmTNgedRY
         S0Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWJpQC8qLiHolOd3ulVVq50JsH1tAspGurrupTfQ0XLRUo43Yj335hzfkZHCsXFTf0rDNnEDTNT@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh5yrwtEk5tFPjLlVTnLt6N6va5K4Bg8rQT0fEnQyUYIX5Bjgx
	UiclqN70UE8MK/Spfjq2fca8WlEzqVHVRkTU1yp0zep70QSvMhLQ
X-Gm-Gg: ASbGncu72ZlfmmaMRJjxOOeKQIfdNhdjyW8GQIRmU8uPXY7hOswLO+6XeXjq0mMi+/N
	b3Vvfod9nGttKTmRfrwBE14oN2aIiYhkTi/QIxHEJUmn6xR5+6aR93jMPam+r2J3OUVQebwIiAF
	Yk1roXOBGojz/PHZI2Pjjkslb2gJ/wurpbyKmY3i3SJ3BZmcL1nVfHuL22FdryA/XvPvfr1FNPT
	+vIbTQtSvg4CE/vVcOUyZQZEtm6n0NNk+ALhMXS8PgTdovrrXaJTPuzg+j0I305OKEMCe1n67FN
	wh9McsH+8A9iFzCW29I9RyHFwwZxiDGzQx/BsNvJjF76XGla
X-Google-Smtp-Source: AGHT+IEV/9ceYaqgCzY1ZQH1uaVVHner+kvO/+TD3nG4jkQEysozy99K0MOUnJ7/OVsYVjRbB6Us6Q==
X-Received: by 2002:a17:903:2309:b0:220:eaaf:f6ec with SMTP id d9443c01a7336-221a0ec9501mr72162795ad.5.1740168450001;
        Fri, 21 Feb 2025 12:07:30 -0800 (PST)
Received: from smtpclient.apple ([2601:645:4300:5ca0:35f7:b1dc:26f7:f292])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae624a00dc8sm4660203a12.34.2025.02.21.12.07.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Feb 2025 12:07:29 -0800 (PST)
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
In-Reply-To: <CAHk-=wjF0wjD4ko7MgrZ1wBZ9QOrQd_AnyhDDUJQ1L5+i-o22A@mail.gmail.com>
Date: Fri, 21 Feb 2025 12:07:17 -0800
Cc: David Laight <david.laight.linux@gmail.com>,
 Jan Engelhardt <ej@inai.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org,
 ksummit@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <ACFAF4FA-755C-4AD8-9826-168E4A7337B9@gmail.com>
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org>
 <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh>
 <2nn05osp-9538-11n6-5650-p87s31pnnqn0@vanv.qr>
 <2025022052-ferment-vice-a30b@gregkh>
 <9B01858A-7EBD-4570-AC51-3F66B2B1E868@zytor.com>
 <n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr>
 <20250221183437.1e2b5b94@pumpkin>
 <CAHk-=wjF0wjD4ko7MgrZ1wBZ9QOrQd_AnyhDDUJQ1L5+i-o22A@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: Apple Mail (2.3826.400.131.1.6)



> On Feb 21, 2025, at 11:12=E2=80=AFAM, Linus Torvalds =
<torvalds@linux-foundation.org> wrote:
>=20
> On Fri, 21 Feb 2025 at 10:34, David Laight =
<david.laight.linux@gmail.com> wrote:
>>=20
>> As Linus said, most modern ABI pass short structures in one or two =
registers
>> (or stack slots).
>> But aggregate returns are always done by passing a hidden pointer =
argument.
>>=20
>> It is annoying that double-sized integers (u64 on 32bit and u128 on =
64bit)
>> are returned in a register pair - but similar sized structures have =
to be
>> returned by value.
>=20
> No, they really don't. At least not on x86 and arm64 with our ABI.
> Two-register structures get returned in registers too.

This does happen on older ABIs though.

With default compiler flags, two-register structures get returned on the =
stack on 32-bit x86, 32-bit ARM, 32-bit MIPS, both 32- and 64-bit POWER =
(but not power64le), and 32-bit SPARC.  On most of those, =
double-register-sized integers still get returned in registers.

I tested this with GCC and Clang on Compiler Explorer:
https://godbolt.org/z/xe43Wdo5h

Again, that=E2=80=99s with default compiler flags.  On 32-bit x86, Linux =
passes -freg-struct-return which avoids this problem.  But I don=E2=80=99t=
 know whether or not there=E2=80=99s anything similar on other =
architectures.  This could be easily answered by checking actual kernel =
binaries, but I didn=E2=80=99t :)=

