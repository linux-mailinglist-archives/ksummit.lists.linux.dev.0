Return-Path: <ksummit+bounces-936-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7997337AB
	for <lists@lfdr.de>; Fri, 16 Jun 2023 19:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 185191C20C77
	for <lists@lfdr.de>; Fri, 16 Jun 2023 17:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E021DCA0;
	Fri, 16 Jun 2023 17:54:40 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4566A19E69
	for <ksummit@lists.linux.dev>; Fri, 16 Jun 2023 17:54:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CD4A64B0
	for <ksummit@lists.linux.dev>; Fri, 16 Jun 2023 17:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CD4A64B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1686937737; bh=hXML5FitnCr/YGFcE5HoFhMAxnIoSrjY1PYIRBdxrRQ=;
	h=From:To:Subject:Date:From;
	b=WHUrIA4C/H+3JNNaU+/dxOYv2a5z57gv9zN+7uCionydgHQjzoXkhYgk7LiCCC1eO
	 aZniYbTVscBq/C6f0JUfEWetoAklKRXLc0ezRO1RNp5ucxRPAjyKID4vJWkkjAmuAU
	 aGVZH2MBfKl1PMdbWZshgXlrBR8akOtXi8noQfPF0oMge+wxvIBRzreDo2ubJ+xfPw
	 9K/biB4MN5wl90i2dl4bQo4XE9K5AhU0Sfm2j/h+FkMRWf07svZuUek/BXHHXCEctK
	 9fvob20uDZLH8VcFpooAz6rvMi90kS+7wcee1zanosUveRfpM689P+ozHtyab9lavy
	 uEMzL2ztwnjEA==
From: Jonathan Corbet <corbet@lwn.net>
To: ksummit@lists.linux.dev
Subject: [TECH TOPIC] Kernel documentation
Date: Fri, 16 Jun 2023 11:48:56 -0600
Message-ID: <87fs6rxppz.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The documentation discussion at past kernel summits has been lively, so
I think we should do it again.  Some topics I would bring to a session
this year would include:

- The ongoing restructuring of the Documentation/ directory.  I've been
  slowly moving the architecture docs into Documentation/arch/, but
  would like to do more to reduce the clutter of the top-level directory
  and make our documentation tree more closely resemble the organization
  of the source.

- Structure.  We continue to collect documents, but do little to tie
  them together into a coherent whole.  Do we want to change that and,
  if so, how?

- Support for documentation work.  There is nobody in the community who
  is paid to put any significant time into documentation, and it shows.
  How can we fix that?

- Infrastructure.  Sphinx brings a lot but is far from perfect; what can
  we do to improve it?

Other topics will certainly arise as well.

jon

