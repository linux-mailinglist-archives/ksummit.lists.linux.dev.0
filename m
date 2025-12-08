Return-Path: <ksummit+bounces-2653-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 737BFCABCDB
	for <lists@lfdr.de>; Mon, 08 Dec 2025 03:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05C053021E70
	for <lists@lfdr.de>; Mon,  8 Dec 2025 02:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375A7220F49;
	Mon,  8 Dec 2025 02:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="R6atph+b"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B86920ED
	for <ksummit@lists.linux.dev>; Mon,  8 Dec 2025 02:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765159679; cv=none; b=dEjPxaRBN0N9xoPiUrJPl7RBWRqMV7guSyhkQKcs21EG0Xg8mQWM2kp38DaLyeyMIxBlz0WWPCge9JbQcMHvsauw3PR6FPy1Uq2o3OoYrmgd66VVIvQMmTAYxXOfD17EeyhInTz2Cpml7kbK3X14ZJ6xaS1pVG1FOxpOHy4QuIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765159679; c=relaxed/simple;
	bh=OC0fda0nj8LMoN59Y2lkF/CgO+SH7fpajDwz7n3k01Q=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DRDVoi/bef4xx/0rBVG4W+zd5MvJC46TyBD7IuA9IMeSZix+5VFrG69TvNiNP8m5il7sbWfgFewMpnH8SHxLjb/Rz6LGatCMQNKVBscwEJAwBPHV1e6tObOQ9eWOPfN+v+yfi70TX9Xj7jfS0uQUHZ638PdnY66qmFFWnV4A4Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=R6atph+b; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7537D4040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1765159162; bh=qmh1sc8+9Bh7jmTgAvqdMGfzZUWhTQTvkF/HnXqmKcI=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=R6atph+bVPueqvyAoF5tMnsoLQflfxrZSnQ1SwClhAuVjxfjoxcxpxAr5GPUkaVTe
	 fJp9u71jYmt43HB1/pnZyXtmJrU4Tzw38ght0nIBsaCsbkoLUZ2xGnMk4TLNhjC1Yn
	 BPCzAK2m8QDQsfRRJh/XPxOoXvY9LgqCx8tJWR5CePkoLLQn0OGxH3+0I7KQzS3xZs
	 w2YTfcMmcgOo6ECN46euCVHJY/AxSH8QdBHpH373elT78rTCF1CxbQIYaii848A/5h
	 F/wix7G74LtptnyxKLzfXn7lrLQ56qkeWa5YU6sK3/yQVnXegDxUXwdseQRASgXt/c
	 d41ocaA+liiDg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7537D4040B;
	Mon,  8 Dec 2025 01:59:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "H. Peter Anvin" <hpa@zytor.com>, Sasha Levin <sashal@kernel.org>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel process
In-Reply-To: <4BDD9351-E58A-4951-9953-00F1E9F24FB4@zytor.com>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <aTYmE53i3FJ_lJH2@laps> <4BDD9351-E58A-4951-9953-00F1E9F24FB4@zytor.com>
Date: Sun, 07 Dec 2025 18:59:19 -0700
Message-ID: <87zf7tg2dk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"H. Peter Anvin" <hpa@zytor.com> writes:

> I contend there is a huge difference between *code* and
> descriptions/documentation/...
>
> Although git is an enormous help, it is still far harder to unwind
> code than the auxiliary stuff.
>
> AI bug reports? We have gotten robot bug reports for
> decades. Translation tool? Not a problem. Using AI to get ideas? Not
> really different than reading out of a textbook
>
> However, *code* taken out of an AI seems to me that it would have to
> be presumed plagiarized. Furthermore, it is very often wrong in both
> subtle and blatant ways.

As you might imagine, I'm not fully on board with that.  Code is assumed
plagiarized, but text is not?  Subtly wrong documentation is OK?

I think our documentation requires just as much care as our code does.

jon

