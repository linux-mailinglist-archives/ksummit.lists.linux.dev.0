Return-Path: <ksummit+bounces-1212-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 746438CE41A
	for <lists@lfdr.de>; Fri, 24 May 2024 12:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 128431F21910
	for <lists@lfdr.de>; Fri, 24 May 2024 10:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7A285268;
	Fri, 24 May 2024 10:21:16 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A9E1AACC
	for <ksummit@lists.linux.dev>; Fri, 24 May 2024 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716546076; cv=none; b=oS642GBMPX4pcq3xpGS9tFfRO6xaSXCP/Lmb8tCJ4b4fxxyng/RWBPy66gUOqGHCw3uuxecPCsB2ptOM/IhTG89kzwpQJb/paDqElB8W/vMEjF5usn/f1oGMNIpJd1PT9a/2ehoLEoon2/q7H77wg4Svx9VVTwIFnQ9cK3L4CKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716546076; c=relaxed/simple;
	bh=CRsMPVShU0jcDGXNPHRdkEE3PCcuOFg6TnVh0o83/yM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DRj3fur2qgXhGhKGV8UvSFxWP0CNiVUmzEoCn/kLkdLoTypRHWH0zmuRd03hPHDZz4MMmqSGT6694265vmcZpMOw00XdVIGoMexFCZ78YLRHK8XuapXwuCX5deitd8s4U8Knp141DXaNyR8xhWHPvzqocNOeHWZO9MBdJ39mi/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1sAS2x-0007NS-Kx
	for ksummit@lists.linux.dev; Fri, 24 May 2024 12:21:11 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1sAS2x-002mUV-2Z
	for ksummit@lists.linux.dev; Fri, 24 May 2024 12:21:11 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1sAS2w-00Bddy-3D
	for ksummit@lists.linux.dev;
	Fri, 24 May 2024 12:21:11 +0200
Date: Fri, 24 May 2024 12:21:10 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: ksummit@lists.linux.dev
Subject: [TECH TOPIC] Graceful Under Pressure: Prioritizing Shutdown to
 Protect Your Data in Embedded Systems
Message-ID: <ZlBqFozNUbhovuig@pengutronix.de>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: ksummit@lists.linux.dev

Hi all,

I just submitted following abstract:

Subject: Graceful Under Pressure: Prioritizing Shutdown to Protect Your Data in
Embedded Systems (Even When the Power Flickers)

Power fluctuations are a common challenge in embedded systems, where
components like SD cards, eMMCs, and raw NAND flash are widely used for
storage. These storage components are vulnerable to data corruption or
even permanent damage when power unexpectedly drops. While larger
systems, such as servers, often employ solutions like uninterruptible
power supplies (UPS) to mitigate this risk, the size and cost
constraints of embedded devices often preclude such measures. Although
some modern embedded systems can detect power issues early, a unified,
upstream solution for gracefully shutting down critical components is
still lacking.

In fact, software-based solutions for prioritized shutdown already exist
in some Linux-based embedded systems. However, these solutions are not
integrated into the mainline kernel. This fragmentation makes it
difficult for the broader community to benefit from these advancements.
This talk aims to bridge this gap by advocating for the inclusion of
prioritized shutdown mechanisms in the Linux kernel. We will discuss the
unique challenges faced by embedded systems, where size and cost
constraints often limit hardware-based protections like UPS systems. By
leveraging existing software solutions and collaborating with the
community, we can develop a standardized approach to power loss
protection that benefits all embedded Linux users.

Join us as we explore the technical and community aspects of this issue,
with the goal of making graceful shutdowns a standard feature in all
Linux-based embedded systems. Let's work together to protect our data,
even when the power flickers.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

