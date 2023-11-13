Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D862F7EA351
	for <lists@lfdr.de>; Mon, 13 Nov 2023 20:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92E3F280EFC
	for <lists@lfdr.de>; Mon, 13 Nov 2023 19:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA5022F10;
	Mon, 13 Nov 2023 19:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="c8ACVMoR"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE1123740
	for <ksummit@lists.linux.dev>; Mon, 13 Nov 2023 19:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BAD4D365;
	Mon, 13 Nov 2023 19:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BAD4D365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1699902603; bh=T9o/PqPHR+uTzTY3cx8/I4D4aUkSjh6y2PTY/b3gPm4=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=c8ACVMoRuLgV8A/PoFlPGvnXmBD493VwMOnou6QO1VUNAf99RWHlKkH847avQb5x6
	 MoDjd2eRI33Ba34+LljGDHGx5cRDajARl+ZSS3uajYlz0I0ZvOYGuFNO00RbAsH7Bi
	 3WMJJyBUDF52yPgVM65Z51kaAcAMCtbA0JIXU0n0Nq6oxiOrGqleXaDvrdHEg2c8uu
	 Xe89GevM2DBS4z4CXjN1iyFGTmEU/Y7mRnRGEFdgjAijjHzG2wjK4QncYeKhI/JLgX
	 fVOH9vQbeFwjT4tYvJwjBJ/74XU53db19K5DeQLTbWwIzXFDGjUkRKOSpbAfJUb17i
	 eUJYpNDtqv7uA==
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linux-foundation.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Prep?
In-Reply-To: <CAHk-=whGOUw=YDsPxd9o5M_JqcisE+TjcQQ-=SLYOnHd12D0Fw@mail.gmail.com>
References: <CAHk-=whGOUw=YDsPxd9o5M_JqcisE+TjcQQ-=SLYOnHd12D0Fw@mail.gmail.com>
Date: Mon, 13 Nov 2023 12:10:01 -0700
Message-ID: <871qct4ghi.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Linus Torvalds <torvalds@linux-foundation.org> writes:

> I didn't ask Jon before, so here goes: Jonathan?  Would you be willing
> to take some input from people, and just scrub the names off it, and
> forward some kind of word cloud of issues (or honestly, just the
> otherwise unedited emails) to me?

Yes, I would be happy to do that.  I've gotten one email already;
anybody else with something to pass on is encouraged to send it my way.

Thanks,

jon

