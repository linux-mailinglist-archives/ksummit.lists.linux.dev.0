Return-Path: <ksummit+bounces-1815-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 625DAA40342
	for <lists@lfdr.de>; Sat, 22 Feb 2025 00:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4694B7AE980
	for <lists@lfdr.de>; Fri, 21 Feb 2025 23:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638F01FF1AF;
	Fri, 21 Feb 2025 23:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailo.com header.i=@mailo.com header.b="L1d/3uHk"
Received: from mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6932C1FBC99
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 23:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.182.54.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740179027; cv=none; b=ZgFfZMRCYYhr8khlhWMXEOtAkKuaezbIaycmJgwIqsMZ+UPkzO0JH8dDZwdWL2nyE9Hv0Txtf5m1WMG5AqzuRQlrqP/frfANbXTahYIc/NTcBCrCi5EaeGOwqbgLB0Pr2a8MKq7I7FR9P1253oPQuwNWz/ja2Par0UX3DITInwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740179027; c=relaxed/simple;
	bh=3uNsCd93qtPZ60J+7z/ITN1DstOm4oM2Au/IBQ2iWNg=;
	h=From:To:Cc:Date:Subject:MIME-Version:Message-ID:In-Reply-To:
	 Content-Type; b=EbjXpNZzPT1mC5ZDw4MQlCyR0Rxo4Z183gft7rQrgOEU6xH+FwVNQyD05vrJOoKRzVh+vW2WL71b7QX1Ze1OAmjXYoJiX3yBljznh/5Rl+cYlQhn4io3mFYRSpxUoQCZKev+Z2CALcutZbiMmq8+vuUoHWyQdoQb5+kSaQ0yYDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mailo.com; spf=pass smtp.mailfrom=mailo.com; dkim=pass (1024-bit key) header.d=mailo.com header.i=@mailo.com header.b=L1d/3uHk; arc=none smtp.client-ip=213.182.54.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mailo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailo.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1740176350; bh=3uNsCd93qtPZ60J+7z/ITN1DstOm4oM2Au/IBQ2iWNg=;
	h=X-EA-Auth:From:To:Cc:Date:Subject:MIME-Version:X-Mailer:
	 Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=L1d/3uHklkhK8ADWQOVyoSEtpItIWSwcgLAKjehZaLBM+IeAknbZw27JGQTWvqYe7
	 n3OC9T357MUWKUzuv3wWG9yyU+d2BKTfg5yl9290UXy/36cMMAxLc2by/51FFTdAwD
	 xEFQyuhEqoNDq2mWYVDhXcRnI4wgfRr+0kifDI8A=
Received: by www.mailo.com with http webmail; Fri, 21 Feb 2025
  23:19:05 +0100 (CET)
X-EA-Auth: yCvXEICkzd/F+ueWyXr7Du7hGifP/xADp5si9oIDqEdqeV9l3o6aSTx7w1HLHBLm/UaDqX1rU+NCaupw9nKi9vGZKpkgrk+o
From: henrychurchill@mailo.com
To: torvalds@linux-foundation.org,
 "Jan Engelhardt" <ej@inai.de>
Cc: "David Laight" <david.laight.linux@gmail.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Greg KH" <gregkh@linuxfoundation.org>,
 "Boqun Feng" <boqun.feng@gmail.com>,
 "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 "Christoph Hellwig" <hch@infradead.org>,
 "rust-for-linux" <rust-for-linux@vger.kernel.org>,
 "David Airlie" <airlied@gmail.com>,
 linux-kernel@vger.kernel.org,
 ksummit@lists.linux.dev
Date: Fri, 21 Feb 2025 23:19:05 +0100 (CET)
Subject: Re: C aggregate passing (Rust kernel policy)
X-Priority: 3
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: COMS/EA24.10/r20241127
Message-ID: <ea-mime-67b8fbd9-4d24-7169ab18@www.mailo.com>
In-Reply-To: <CAHk-=whZwXK9shqeV5fpRF9CRqApVy5wz6myNeAkyuFm-ERTpQ@mail.gmail.com>
Content-Type: text/plain;
 charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


---- Original message ----
> From: Linus Torvalds <torvalds@linux-foundation.org>
> To: Jan Engelhardt <ej@inai.de>
> Subject: Re: C aggregate passing (Rust kernel policy)
> Date: 02/21/2025 21:26:02 Europe/Paris
> Cc: David Laight <david.laight.linux@gmail.com>;
>       H. Peter Anvin <hpa@zytor.com>;
>       Greg KH <gregkh@linuxfoundation.org>;
>       Boqun Feng <boqun.feng@gmail.com>;
>       Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>;
>       Christoph Hellwig <hch@infradead.org>;
>       rust-for-linux <rust-for-linux@vger.kernel.org>;
>       David Airlie <airlied@gmail.com>;
>       linux-kernel@vger.kernel.org;
>       ksummit@lists.linux.dev
>=20
> On Fri, 21 Feb 2025 at 12:06, Jan Engelhardt <ej@inai.de>=20
wrote:
> >
> > >(Apart from the fact that c++ makes it hard to ensure all=20
the non-class
> > >members are initialised.)
> >
> >         struct stat x{};
> >         struct stat x =3D {};
> >
> > all of x's members (which are scalar and thus non-class)=20
are
> > initialized. The second line even works in C.
>=20
> Yeah. People love to talk about "safe C", but compiler people=20
have
> actively tried to make C unsafer for decades. The C=20
standards
> committee has been complicit. I've ranted about the crazy C=20
alias
> rules before.
>=20

The unsafe subset of Rust has way stricter aliasing rules than=20
C. You should read up on unsafe before touching it in Rust, it=20
can get gnarly.



