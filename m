Return-Path: <ksummit+bounces-495-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AD54072D2
	for <lists@lfdr.de>; Fri, 10 Sep 2021 23:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 46BE13E10AF
	for <lists@lfdr.de>; Fri, 10 Sep 2021 21:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB682FB6;
	Fri, 10 Sep 2021 21:10:49 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4DA3FC3
	for <ksummit@lists.linux.dev>; Fri, 10 Sep 2021 21:10:47 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 96DA25ECE
	for <ksummit@lists.linux.dev>; Fri, 10 Sep 2021 21:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 96DA25ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1631307659; bh=qPPBiMF++/9ljHqRyFKsmdAQGX+kfeP3+uIU7xJADBs=;
	h=From:To:Subject:Date:From;
	b=MeHt8vlC4L1iV2kBMAOwlJ/8yg3Oi39kRSAeYuS1Y0330zgHIWHv1JcCpH3D6WIbY
	 HrnX9qurHsyYcbX2tuoAJfpH02LzTzaaNJ2jDg1x5ZH5xJ/nh0JUpB3vPA9Otxjxm3
	 tWO4f3EgYh/vif9dhSYH3m6Utu6yq2OA/gghcf4qXJdVWaE6v/KOiHqBBQ/C3XbWcp
	 ZUpUVnHkEw8bOdaNuOrWQ08FFPb26VSpf7C0ZfDlHROreD4uPBE+gb7t2ZITroMWhU
	 V9HvR24FSjFdPne8pVm1el9uUjUNdRccpzckJkNRFIgsWEBKAmMFDfKH/PCn/nPeda
	 K59DnBN5H8GwQ==
From: Jonathan Corbet <corbet@lwn.net>
To: ksummit@lists.linux.dev
Subject: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
Date: Fri, 10 Sep 2021 15:00:58 -0600
Message-ID: <877dfop2lx.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

There has been a regular disagreement in recent years about whether
drivers for accelerators (such as for the Habana Gaudi device) should be
subject to the same requirements as GPU drivers when it comes to the
availability of a free implementation of the user-space side.  It flared
up again recently:

   https://lwn.net/Articles/867168/

Happily, the Habana situation in particular seems to be resolving
itself:

   https://lwn.net/ml/linux-kernel/CAFCwf119s7iXk+qpwoVPnRtOGcxeuZb3rnihf6NWWoVT-4ODHA@mail.gmail.com/

But even there it is clear that the fundamental question has not yet
been resolved.

This seems like the sort of question that the maintainer summit exists
to address.  Specifically, we could discuss:

 - Under which circumstances should the kernel community require the
   existence of freely licensed user-space code that exercises all
   functionalities of a proposed kernel driver or feature?

 - Are there internal kernel interfaces, such as DMA-BUF or P2PDMA, that
   are only available to drivers with a free user-space implementation?
   Do we need an EXPORT_SYMBOL_USERSPACE_GPL()?

 - What constitutes an acceptable user-space implementation in cases
   where these restrictions apply?

I suspect that more clarity (and fewer arguments) on these questions
would be welcome both within and beyond the development community.

Thanks,

jon

