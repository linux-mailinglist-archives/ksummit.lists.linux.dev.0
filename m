Return-Path: <ksummit+bounces-2217-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB785B32535
	for <lists@lfdr.de>; Sat, 23 Aug 2025 00:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B21AD1C857EE
	for <lists@lfdr.de>; Fri, 22 Aug 2025 22:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3890F286433;
	Fri, 22 Aug 2025 22:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="M4CTgIMQ"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772942820A3
	for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 22:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755903354; cv=none; b=A+yv991NWzkooMy9D/UTcyjSLrlLMTLxydp/na2QvSIPIIc2ws2rBQ6d0R5RAsSj6mgb7hFBRCtiiT/QZGFauWD9WmWKjxAXuX5hjUdJYtYjUtgN8OiAUizgWweJRLm/jntpaAE9fsmD4zgPmWc15p0YGc3z5GKbTosrB2WILlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755903354; c=relaxed/simple;
	bh=pjnoIqZ5etJf+6qjq99XG+DEUE12xURr+lLVH88Q7FU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DmueGpwdZAJLpwRy8qjpis3wUwaEYhUyP6CPY5LMSEz9tAeB1hxOuG8faqnG+kkH6k64bvpz5QfQod5iKrIE0OIj1FaGJ2d3pU0AMrZv+sLBqG4xWags9lmGNIWDH33LGTKjGrhWu8wGEOLOlgVzaiyJBihTaoV9brHc+3PsWn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=M4CTgIMQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2AC0D40ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755903352; bh=fC4ZjefQHml70eT0Wiu1YYbns7br3ZZLR5q9VSG/8Hc=;
	h=From:To:Subject:Date:From;
	b=M4CTgIMQmr70MMrmDlJdeyoB+td2ftTvBNUAWgRDB16s4fghXf5KWFYcxp9Tz0j4k
	 80I9t83GhZs42vXzL4gGonlbxh6wUhZR7qtB8qwAKfRTuVy/o1QO6EAGEqXx5ERr+F
	 a4A8LGMt/886F7BiMja14kqO6LBuDiR3ci1s+txNNFNLnk2SvyaqXOm/MLEQyTfOkZ
	 C/wJe9Z5ttYXGbbXgZXOa+/hMIbPuKbI4NFCWsxwnkiDOvEGI9+lsbWhns7zVW9uQV
	 yEWRofS2OaxpaR0g4OEAmca6Ya1IxILXKbL5F4qAPi9o21P7biObN/LCDmRcKjyp8v
	 zzAiP3bMytiFg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2AC0D40ADA
	for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 22:55:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: ksummit@lists.linux.dev
Subject: [TECH TOPIC] Kernel documentation - update and future directions
Date: Fri, 22 Aug 2025 16:55:51 -0600
Message-ID: <87plcndkzs.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The last year has seen a massive amount of work in our documentation
build infrastructure and continuous improvement in the docs themselves.
This session will provide a brief update of what has happened recently,
followed by discussion on what we want to do next.  How would we like
our documentation to evolve in the next year or three?

jon

