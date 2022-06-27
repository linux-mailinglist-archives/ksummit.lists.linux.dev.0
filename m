Return-Path: <ksummit+bounces-725-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D105B55BAB1
	for <lists@lfdr.de>; Mon, 27 Jun 2022 17:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BD02280CBB
	for <lists@lfdr.de>; Mon, 27 Jun 2022 15:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7ED33D9;
	Mon, 27 Jun 2022 15:18:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A7D3235
	for <ksummit@lists.linux.dev>; Mon, 27 Jun 2022 15:18:57 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 429972D3;
	Mon, 27 Jun 2022 15:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 429972D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1656343130; bh=Bdia5VnPr/ijgu6xdW48/tlt8nrj9Du/KbIetyYMZ5A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tA0Yd0vCF24l0OSY7eDuGA9GuHQS10c8kKe+3ZleHS284yyTXP2CQ7bJIbdh3kEWL
	 YmXCajlFkXCiYJ/NXUM33c3cQt8tNEzfXaY+gOpPEUhVAvYR6VolIDvIc2omHuIDhZ
	 taZpBFKFa71tycqnTjdImBYYRcQlusUiAahL+JiQg5C+50d4Nba1njyObRuWp96HUG
	 /OoxMJjHi78mqjM/LDQZgjFPncGCNJT0UdMWUp7HwJh3G22NsXFTNhdeW7TPMHaEK2
	 X1tklLAp1rGzSrAjD8bbpwr2NRWDn3tF17VmVYZIbRgNVcTEdB71MNS6cuFSRHVKye
	 uM/vu09vKtjNA==
From: Jonathan Corbet <corbet@lwn.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
In-Reply-To: <Yqz2pVwvyo4MFJYO@pendragon.ideasonboard.com>
References: <87sfo3nh3t.fsf@meer.lwn.net>
 <Yqz2pVwvyo4MFJYO@pendragon.ideasonboard.com>
Date: Mon, 27 Jun 2022 09:18:49 -0600
Message-ID: <87k092yw12.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

[yes, I'm running even slower than usual...]

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> I've been wondering recently if it would help to have a place where we
> can record documentation wishes.

One of the conclusions that came out of the LSFMM session on MM
documentation was that having an overall structure in place makes it
easier for people to fill in pieces.  If we could impose more of this
kind of structure on our docs as a whole, one obvious way to express
wishes of this sort would be to add an empty section where the need
exists and hope that it inspires somebody to fill it in.

Thanks,

jon

