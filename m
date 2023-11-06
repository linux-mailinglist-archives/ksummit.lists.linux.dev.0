Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3321D7E2AF3
	for <lists@lfdr.de>; Mon,  6 Nov 2023 18:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78F07B20F74
	for <lists@lfdr.de>; Mon,  6 Nov 2023 17:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0170829D05;
	Mon,  6 Nov 2023 17:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=80x24.org header.i=@80x24.org header.b="QVVbc4j5"
Received: from dcvr.yhbt.net (dcvr.yhbt.net [173.255.242.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CCB29CF8
	for <ksummit@lists.linux.dev>; Mon,  6 Nov 2023 17:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=80x24.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=80x24.org
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
	by dcvr.yhbt.net (Postfix) with ESMTP id E111E1F406;
	Mon,  6 Nov 2023 17:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=80x24.org;
	s=selector1; t=1699291274;
	bh=ZVdkFed+w54to46gZ0V3Kto1e96f4nMYhOMZgOEoyJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QVVbc4j5mjmaaBBha7CE3LGgb7bDsnZ9j99STN+h5eaWySuJKw76Mv3xrVJr0S+Lh
	 0Wc91bz+CbBM8OrnB0vwdfh9TORkYzVm7XhGZGOid2AsnwPI3XDCnHU+CA2xpmCLe3
	 c0PH+96ZyWMOAoXq00DE690YWDf7cAMPth5v45i4=
Date: Mon, 6 Nov 2023 17:21:13 +0000
From: Eric Wong <e@80x24.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231106172113.M499728@dcvr>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <87r0l2yi7v.fsf@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87r0l2yi7v.fsf@email.froward.int.ebiederm.org>

"Eric W. Biederman" <ebiederm@xmission.com> wrote:
> Has anyone come up with a good way to mirror the public inbox git
> repositories?
> 
> In the rare occasion when public inbox splits git repositories any
> script that just mirrors the git repository silent stops working.

public-inbox-clone + public-inbox-fetch in released versions
of public-inbox work for mirroring individual inboxes.


public-inbox-clone for 2.0 (WIP in https://80x24.org/public-inbox.git )
can mirror multiple inboxes at once using grokmirror manifests
(no need for -fetch).

