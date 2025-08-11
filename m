Return-Path: <ksummit+bounces-2119-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B735B218C8
	for <lists@lfdr.de>; Tue, 12 Aug 2025 00:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 755652A690B
	for <lists@lfdr.de>; Mon, 11 Aug 2025 22:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371A622A4F4;
	Mon, 11 Aug 2025 22:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ReSbNpn1"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9EF199FAC
	for <ksummit@lists.linux.dev>; Mon, 11 Aug 2025 22:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754952881; cv=none; b=JDwjrFRRrcY9pYKS55NjtRdfqb6LItSt1RCnqdMYEXGGkeJS4PDLlmivaEZzJ5hQTJ3vzAccXif7QYO1tvL4n7dxZ4s6CiT5ary2x/6t08efgy0AG+k7nva3pGfrVKmT00hMiZNJs/LALAusRIZ7Zzub4K206DkK2xBl0NnexPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754952881; c=relaxed/simple;
	bh=UzRkIFph4Do4Ajr4k7uEZGSMzK/BvG0OpYw7EyAtp9M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CAq8cxQK7QJsCve0ZCqeoAGbH4segL/0f5hh22BfwPDpKxHMfesl9kA9pyoXNCFjWgwsyA5Ko8I1UbNs0X9X7f22Zv3P4U5wSO/WyaJs2w0XNOOm4GJ7QybvXPjsykyAn60hnXuvkyrheQY41rIDJ/rvJ7mveMNuFKuveDuy2ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ReSbNpn1; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 404F840AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1754952879; bh=sFooeJ+XUufMe6DK0+zudrA3ohgQz7dwkniIi3c7LHU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ReSbNpn1iKMtWfVh28pSCYwhzQ5j09VtALC6NQBFXLs7qrJaGXBoMA0+JnMFUvGQR
	 Gsx9fKtOaQakFz0vtLtizkEVYe479zKHmWh+LoJPZ38WLzLOKAhhihvV4jO/Xnq06h
	 ImPAxlUIATtERqV9Dc4ZkBKUf9YI3OjPayWMtVS/6GCA5HujU8DWVBk2Rj5XgqeoDK
	 cYktHWyYQOAvs/UBcY6qeuj2HOsQkOUUXJ2UdktZ2lc0NvbKjeTVn6gLcA0sI5qq0x
	 iNpXFlBFIcoPpSJpNPtZczGUJwQgCBjCCmnayvADSkLMDOvBNaqIzC7yhrgKvrqGeD
	 3NsISHDhH14ZQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 404F840AD5;
	Mon, 11 Aug 2025 22:54:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: paulmck@kernel.org, "Luck, Tony" <tony.luck@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
 Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
In-Reply-To: <cad0806b-3a87-4630-b19a-bbe8d9db1701@paulmck-laptop>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy> <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpnStlxDUsGNPuA@agluck-desk3>
 <cad0806b-3a87-4630-b19a-bbe8d9db1701@paulmck-laptop>
Date: Mon, 11 Aug 2025 16:54:38 -0600
Message-ID: <87o6slbhap.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Paul E. McKenney" <paulmck@kernel.org> writes:

> Another option is "The AI was trained only on input having a compatible
> license."  Which, to your point, would to the best of my knowledge cut
> out all of the popular and easily available AIs.

That option, of course, opens a separate barrel of worms: if we are
relying on the system having been trained only on compatibly licensed
material, then our ability to distribute the result depends on our
complying with the relevant licenses, right?  Including little details
like preserving copyright notices...?

Somehow, I don't really think that this option brings us much joy.

jon

