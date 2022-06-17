Return-Path: <ksummit+bounces-648-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 028A254FE96
	for <lists@lfdr.de>; Fri, 17 Jun 2022 22:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 51CA62E09EC
	for <lists@lfdr.de>; Fri, 17 Jun 2022 20:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E374A4C8B;
	Fri, 17 Jun 2022 20:57:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A7D4C84
	for <ksummit@lists.linux.dev>; Fri, 17 Jun 2022 20:57:17 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9AD2E380;
	Fri, 17 Jun 2022 20:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9AD2E380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1655499431; bh=QHrwIn58SgXl8Bet1v2+WpPM77eMl/K5oLiuEM/QJYI=;
	h=From:To:Subject:Date:From;
	b=o2DZ88UA3mBD8QWmyxSsUoOyzZgCaihw4FaHxyh1E+YJnHM/AQgxeVmj8hvkQkNKe
	 RzNXmDzN0XRPKPuqBdub0n4lQIIYZO1Wc9aW+i+naSRObD0rkvNxQXYXyGnX43XSWx
	 oOb8qfjSO2cFa/qynDLwae/3Pe8nxokzXLyLCBqUxk5A7cILb77FHWlVxCicMQASvB
	 dSxIROlT7UrwEl0hh88nVczHF7VOtAqxeKmSs8iSaXgPJ8c8205jEOnPCGt2O+DnKi
	 DmSVSefZ7DulhMR/7ENjj/ianFH1e8TwFiCqwNMbiDMteGUY+lgDgFuczZ1tZoJzio
	 lTx+m3gz6P0dQ==
From: Jonathan Corbet <corbet@lwn.net>
To: ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev
Subject: [TECH TOPIC] What kernel documentation could be
Date: Fri, 17 Jun 2022 14:57:10 -0600
Message-ID: <87sfo3nh3t.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The development community has put a lot of work into the kernel's
documentation directory in recent years, with visible results. But the
kernel's documentation still falls far short of the standard set by many
other projects, and there is a great deal of "tribal knowledge" in our
community that is not set down. I'd like to look at the successes and
failures of the work so far, but intent to focus on a discussion of what
our documentation should be and what we can do to get it there.

Questions to discuss include:

 - Bringing an coherent overall structure to Documentation/

 - Making it easier for developers to improve the documentation.

 - What we would like from Sphinx and what we can do to make it happen

 - Making the docs build system less ugly and more maintainable

 - Integrating rustdoc documentation

jon

