Return-Path: <ksummit+bounces-1814-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB709A40308
	for <lists@lfdr.de>; Fri, 21 Feb 2025 23:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F32BB3A45BF
	for <lists@lfdr.de>; Fri, 21 Feb 2025 22:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E90B250BF3;
	Fri, 21 Feb 2025 22:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailo.com header.i=@mailo.com header.b="BK612r1X"
Received: from mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1AE204C3A
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 22:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.182.54.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740178389; cv=none; b=rN3KWorzWD/jC7oHkDLxPUgm5onLWg1yH4oy5bLN50rSSE1jhW/QKvB0oAWjNdnfoXPArW6t5piGYr3qKv0NOcNVnLBXIvTMudGMtSppG6bZEbPgLu5p3fcipwCCm6C6pkrEYh7PnPnlmdFIiN1JPQ29s54Sx+HmizuevQeonQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740178389; c=relaxed/simple;
	bh=cRUwksf4u+5RiYbEvj1XWVJNajVosPkimIDSkGK2VQg=;
	h=From:To:Cc:Date:Subject:MIME-Version:Message-ID:In-Reply-To:
	 Content-Type; b=s4xGxpiBbW0RtMKdIDYAyFKcwBmXIyWlF699G3hvjYQ0cfK/hLEvD0TSupdohUr/k0yWj2j7Rx8ZIL0WzcQ2r3gssy41YXZdGIuctriwCaD8cC5L1rNSR1J8KM/L/XtWBHwo2CFcKRtu9c89tN+CZyK9soTeDEfFfAMzwHLX11w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mailo.com; spf=pass smtp.mailfrom=mailo.com; dkim=pass (1024-bit key) header.d=mailo.com header.i=@mailo.com header.b=BK612r1X; arc=none smtp.client-ip=213.182.54.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mailo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailo.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1740178347; bh=cRUwksf4u+5RiYbEvj1XWVJNajVosPkimIDSkGK2VQg=;
	h=X-EA-Auth:From:To:Cc:Date:Subject:MIME-Version:X-Mailer:
	 Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=BK612r1XETzHb2k+sML5ZBPdw8gHZdxkU9F53JsDJjHkGXPgobAlGOQf0vacUtnHo
	 yrOhfwz377nIh4IwCphhPwYXRRCQj5CT1QOjC1Wg534EMr2yXFANBGxpJYNznz6+32
	 JsU0Wv+ppuiRVPThpw1+UmMzGDH6nVN1iXQERA5c=
Received: by www.mailo.com with http webmail; Fri, 21 Feb 2025
  23:52:23 +0100 (CET)
X-EA-Auth: 6de4wPF2sLGGf2XJmdVIVM85OhhIJ8NRtB/wTlgmIjIGzPxomYaDGIZYctjlWcg7vA8ogg6PBvq/APrsOYDwEpPD3LK22ei7
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
Date: Fri, 21 Feb 2025 23:52:23 +0100 (CET)
Subject: Re: C aggregate passing (Rust kernel policy)
X-Priority: 3
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: COMS/EA24.10/r20241127
Message-ID: <ea-mime-67b903a7-304d-556b6e1@www.mailo.com>
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
> Yeah. People love to talk about "safe C", but compiler people=20
have
> actively tried to make C unsafer for decades. The C=20
standards
> committee has been complicit. I've ranted about the crazy C=20
alias
> rules before.

The unsafe subset of Rust has way stricter aliasing rules than
C. You should read up on unsafe before touching it in Rust, it
can get gnarly.



