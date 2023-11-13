Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 470647EA33B
	for <lists@lfdr.de>; Mon, 13 Nov 2023 20:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00997280F2E
	for <lists@lfdr.de>; Mon, 13 Nov 2023 19:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A3922F13;
	Mon, 13 Nov 2023 19:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EDD67jE5"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B7A22EEF;
	Mon, 13 Nov 2023 19:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F68CC433C7;
	Mon, 13 Nov 2023 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699902088;
	bh=EI/VuoX95dK5t5e3Or/LZkyovCHdN4RknQyHwpNok10=;
	h=Date:From:To:Subject:From;
	b=EDD67jE5UmJSIrwB08XijKhOoGt24eJ2C5shuhUv9H/KjMy0EIpMcE409b+7AImm6
	 pmpqQU2cHXYeYjdqAL7rWOIMlZpLC0OTVT+YyNy5GBe8SVrk1TvsNQN8ndlqO+08py
	 1psMuKAqsjdVnAdL3PVSUCIB67eTmD4gJF6EZBuk=
Date: Mon, 13 Nov 2023 14:01:27 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: ksummit@lists.linux.dev, users@linux.kernel.org
Subject: kernel.org "office hours" at LPC
Message-ID: <20231113-caped-elk-of-acumen-cecd7f@nitro>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

If you're at LPC you've had a long-standing kernel.org thing you wanted to
discuss or a problem that needs fixing, or a tooling suggestion, then please
drop by the Potomac E room. I'll be somewhere around there for most of the
conference.

Best regards,
-K

