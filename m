Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE257F1E49
	for <lists@lfdr.de>; Mon, 20 Nov 2023 21:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A2C91C215A8
	for <lists@lfdr.de>; Mon, 20 Nov 2023 20:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5FB30FBA;
	Mon, 20 Nov 2023 20:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Acb5SVPf"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B84225CA
	for <ksummit@lists.linux.dev>; Mon, 20 Nov 2023 20:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Received: from localhost (unknown [98.53.138.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 19876537;
	Mon, 20 Nov 2023 20:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 19876537
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1700513697; bh=C8wqDV0BF6OF4jVS1f7Lny3fKKuRBGLMTP35jN1mbvE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Acb5SVPfgQSh4m/RnYLo/WAnWW3PLK3Co9HW13izd9dThyFzsZtbizoaITP3AuR9c
	 jT4DzL2Oquxaoar762eUKVQgZ1S8W1MsfjcZtUfGHTILPiiVOVkT4wmNg/6uv4TbhB
	 ftsZyKHTkgE5wJ2ml1mVgeJNXgg4hzR5mdsCA4fSCbSTk+b3a9tcQL/zlQVGXqvoJy
	 /H1V1T3uwEymC3CGUbZX4XM5jbpdMMqDgPtwBnHEPULDTrw0huNXwg1xT/5RjLl0xs
	 fRVIoLyzWWTeAqU88i70YLXzaqm5EgALVl823y61CrKrcKhVXl7YnhLU5kzXcX8TXq
	 3G6AEY5vzXgWw==
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Jani Nikula
 <jani.nikula@intel.com>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Kernel documentation
In-Reply-To: <20231120154216.683c1203@coco.lan>
References: <87fs6rxppz.fsf@meer.lwn.net> <871qi6glzl.fsf@intel.com>
 <87v8fiq6cl.fsf@meer.lwn.net>
 <430ee6bb-2556-4674-ae9d-fd7729bf8afd@oracle.com>
 <877cmc7cut.fsf@meer.lwn.net> <20231120154216.683c1203@coco.lan>
Date: Mon, 20 Nov 2023 13:54:47 -0700
Message-ID: <878r6s5enc.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab@kernel.org> writes:

> Cross references is quite useful for media docs. Having a way to
> optionally disable it to speedup builds may make some sense, but
> the default should be to have it enabled and producing warnings.

FWIW, disabling the automarkup extension (which generates the bulk of
cross references) takes about 25% off the build time.  We could
certainly consider adding a compile-time or build-time option for that.
The warning situation should not change at all; automarkup only adds
cross-references to targets that actually exist.

jon

