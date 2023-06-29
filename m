Return-Path: <ksummit+bounces-941-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FE2742F9D
	for <lists@lfdr.de>; Thu, 29 Jun 2023 23:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87D8280EDE
	for <lists@lfdr.de>; Thu, 29 Jun 2023 21:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A27DFC16;
	Thu, 29 Jun 2023 21:43:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1FFFBF6
	for <ksummit@lists.linux.dev>; Thu, 29 Jun 2023 21:43:41 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B1937732;
	Thu, 29 Jun 2023 21:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B1937732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1688074483; bh=an+HpLwUDyBbQvHtbxMmlGKRw6+gsLlvdgErAvnTcqE=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=SQhd+QH0XDEAEk5ZFwAca+bcci0Wapa4TYd4N33zJc3im3KNBrm+Mz2GwE/rRUPCe
	 f3r1kFOZLyr116tri+/Pn+k1Pj41S38sVt7upRCaeIwfrzUlPJTmlmws5oQa4C53fi
	 cGhySIL4e+Ffm/k+sX5d2HFwTlBmKZgnPTM/R4B41g/kQhKv/PcnEZzDS8ulPJtgrP
	 JEfasm7aLEQMRbPTu+mxvUMtPUNFZSTWBv/4nVgmHd33SZjU7Xjw24VRE4K7hFbQOk
	 RwZ7f/I7HBMDA1i3b2X/s8Yp4B8AvZW0RDYktlr9AX9ISc4TjL/4mbFE5H4igExkLU
	 WcFGHfhUKumDw==
From: Jonathan Corbet <corbet@lwn.net>
To: Jani Nikula <jani.nikula@intel.com>, ksummit@lists.linux.dev
Subject: Re: Intersphinx ([TECH TOPIC] Kernel documentation)
In-Reply-To: <871qi6glzl.fsf@intel.com>
References: <87fs6rxppz.fsf@meer.lwn.net> <871qi6glzl.fsf@intel.com>
Date: Thu, 29 Jun 2023 15:34:41 -0600
Message-ID: <87y1k2kl5a.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jani Nikula <jani.nikula@intel.com> writes:

> - Consider splitting the whole documentation to multiple smaller
>   projects, and linking between them using intersphinx. (This may be a
>   tall order.)

So for anybody who is interested, I went and revisited this.  Actually
splitting the docs into separate books would not be that hard, and
intersphinx will indeed manage the cross-references between them without
a lot of extra effort on our part.

There is a catch, though: In order to be able to create the cross
references, intersphinx has to be able to read the "objects.inv" file
for every other document it refers to.  That file, of course, is created
by building the docs.  In practice this means that, to generate a
complete set of manuals from a clean repository, it would be necessary
to do *two* complete builds - one to create the inventory files, and one
to use them.

That is not exactly the path to a faster build experience.

My conclusion is that intersphinx is aimed at enabling easy linking
between entirely independent sets of manuals, where you can't build
everything together in any case, and not really at our use case.  I'm
not convinced it buys us much over "make SPHINXDIRS=".

jon

