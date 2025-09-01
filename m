Return-Path: <ksummit+bounces-2261-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31855B3EF00
	for <lists@lfdr.de>; Mon,  1 Sep 2025 21:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3A07485C17
	for <lists@lfdr.de>; Mon,  1 Sep 2025 19:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C145267B00;
	Mon,  1 Sep 2025 19:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="MsOnnd8u"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D8242050
	for <ksummit@lists.linux.dev>; Mon,  1 Sep 2025 19:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756424; cv=none; b=NX6H0jae+OHjW5beq25VBiX4O+L01+8f4qdVhXr2eN6sj/sbbKdZ/P6YOGKstj1aW7rb/LNkaliWmWTILKsXAQ2t9lqndK/u1UJQ/XyYfg/MG55DrKlFDUtdwqNDFxhEY8eBFRxBmq2huYgFc1WMag7guVFh/VCtPaIuMlb0FzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756424; c=relaxed/simple;
	bh=fuVPKtZujc1twALwzZosVHGjjbpzgwGFJ6d1NGcmTQo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bVlvg8Nip7wzw7RW+fDcdwOY/jo6uq3fOvbnu1SCjGGhBoQzxb7SZqkbElKNqbX+YBJcgAzm7o3k9uDPLN4N3ZfuUvzJCCKmET6MlU71DHIhxrirpGZ37vOwGWn+o/ViUTX9qsXEj1+W26eMHqLf0NlencuSCJITONqzpUJ+3aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=MsOnnd8u; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EF1D640AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756756422; bh=sxcV7YO6F/bJOSld/DB7Mb2D68TL8om4zsJ13UviEa0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MsOnnd8u/w/FHU1zv4oLd03U2CI/UosmrNOnWEXLvS0MKJKfw87nbp+W0dEtFfv1D
	 P1igp1X64z374Knq/x4F/wmZJoLG79NMAGtXxBujIYKE4BX+1O424/RlEUziWYgmRb
	 /eMO9eWg5O6ueEWaOiu6GwafEVLP+fjPL+DKYW/9AjBuSvDb1lHmqMYl5omxojhdaE
	 ABlDr6Tm04StD3Xl9XbbGJEcDat742W2Ff4lovo6Z6xfLlIHcONxoAwnnsamtFwk30
	 CQC3dZvqgi7vLAZ3Pt7QuHtf0HQjHYXwnGr7MspmQw5pDh5/3ax4EaqtEAzBjhMQ+H
	 yL1k/Fv8JvEjg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EF1D640AE3;
	Mon,  1 Sep 2025 19:53:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mark Brown
 <broonie@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Jani Nikula
 <jani.nikula@intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <20250901204635.51b81ffd@foz.lan>
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net> <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
 <20250901204635.51b81ffd@foz.lan>
Date: Mon, 01 Sep 2025 13:53:41 -0600
Message-ID: <87plcax83e.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> It should be noticed that kernel-doc doesn't run in parallel. Python
> still suffers for a global big lock (called GIL). My attempts to run in
> parallel actually made kernel-doc slower, but this is changing: the
> next Python version is planning to get rid of GIL. So, maybe within
> a year we can re-add the patches to run it in parallel.

I certainly wouldn't want to discourage work in this area, but I do
wonder if it would be worth the trouble; kernel-doc is nowhere near
being the bottleneck in this whole process.  Now, if you could
multi-thread the Sphinx HTML builder...

jon

