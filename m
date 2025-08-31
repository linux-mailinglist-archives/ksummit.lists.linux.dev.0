Return-Path: <ksummit+bounces-2244-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C444AB3D520
	for <lists@lfdr.de>; Sun, 31 Aug 2025 22:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B78734E117A
	for <lists@lfdr.de>; Sun, 31 Aug 2025 20:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD9E186E2E;
	Sun, 31 Aug 2025 20:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LcPr6u0L"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D12335C7
	for <ksummit@lists.linux.dev>; Sun, 31 Aug 2025 20:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756671373; cv=none; b=Vtkdzqfgxso1vQcCxLgtu0gCxTvO1EdLaCEtG2BiTQ5PhGEMKDjFehc2/HLsja/815N+bgP6Imgbxxc/8mLxluu/udHXepFgRm/ERIC46n1A+FElkguJGn2WuodNLZKm/ga9+lYE2lT48+o11cRfej/1BXinEfuva5kiYMIAQPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756671373; c=relaxed/simple;
	bh=Bt0MKz5JWipWRvhyH8FMfEZDpnjgo84Zfkg9PbFzdAE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BOivvOo1d/5oaa285Rrn8EG7WLYqsawf+vgvsgLaHV1hhi9lVoQUvZJZgRKBtnczl4dOVFzfBFCySiydDma4MADU3j35s8JMV6BCNAJx7QpBtYHJYZN9RhD5Dc/MJd6GBT0SAhNY3h3kbqv7up5kPGn8J/VtafRa3biNNDv6iUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LcPr6u0L; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 849CE40AE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756671371; bh=TohYY3bEBl06Ls09hBaNNty6yEaIzcNgoyLcDA5LGcI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LcPr6u0LOoVO3m9jy7lU51juvldpNn99QvjX2E9/ebEA8nROc4iXkYgaMWaTAPNys
	 p+BNsoyveyCeCr+0p3Y8p8DlT2uTeZe8mkd7aEuLJENfAkJStWUGRXE4Ii/uwBdohn
	 +HeDzMOlm6WCOXyQjEPfolOL1RBVq9DKHKm0jhajK5z2zm2pK1SiaOv9dnZGVdWHQc
	 c+Y4Y0Xxc+o1EW0vcH4K0fd8O1iM22bITySqpqds4puMuKmXJqiIZdp6DEnWJuUKuy
	 bK2u2r6I2dnPfxJsKhLIcijyvsosLBHhcMRza/RSKwZhuS/K6hKSzmiBsnBDMUlvGz
	 ptCycihtxpuYA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 849CE40AE2;
	Sun, 31 Aug 2025 20:16:11 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <20250831160339.2c45506c@foz.lan>
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net> <20250831160339.2c45506c@foz.lan>
Date: Sun, 31 Aug 2025 14:16:10 -0600
Message-ID: <87zfbfz1px.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> 4) kernel-doc kAPI
>
> It shouldn't be that hard to do the same for kernel-doc kAPI documentation:
> kernel-doc now can parse the entire tree with:
>
> 	$ scripts/kernel-doc .
>
> Someone can easily use it to discover the current gaps at the docs that
> have already some kernel-doc markups and identify what of them aren't
> yet placed under Documentation/ ".. kernel-doc::" markups.

...or one can use scripts/find-unused-docs.sh, which was written for
just this purpose :)

This sort of discoverability is part of why I want to move documentation
tooling into its own directory.

jon

