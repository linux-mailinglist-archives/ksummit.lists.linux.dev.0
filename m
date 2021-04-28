Return-Path: <ksummit+bounces-165-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB8E36D5D5
	for <lists@lfdr.de>; Wed, 28 Apr 2021 12:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 6C9743E0F7A
	for <lists@lfdr.de>; Wed, 28 Apr 2021 10:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568B52FA6;
	Wed, 28 Apr 2021 10:29:59 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6BC71
	for <ksummit@lists.linux.dev>; Wed, 28 Apr 2021 10:29:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9162613FF;
	Wed, 28 Apr 2021 10:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619605797;
	bh=8C+OErcF42crulhtmpO3zOoSt0k/g7nGDTskXCzZBv0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Da432CDk5RTSR+1+b85H4jxdY4rw0w2r+IVM2U59jpCTLGTuuTqyHcKD+gHDkWs5s
	 tlCQdDuWIM5amEuBPZEbZLEp/8zF4A8Wa6bog/pzz6xY8HWmkIQY3eda4xcWV72zQH
	 0EyDKY6foSXFcEVQPphyRgCCTiBLRlbfyUDJ5rDF5W3Hyh027BmMdsfRge//6oblO9
	 DPxgUcmWFPah1k4/aNdkLDh46k+nRSKasC4vhxisUbFof6Cu4iKEpPNHwUn32INzIy
	 sFCrJiflrUZfOAkZmrYkK8IwQm5hO2H2YfopdfozwyNX3WYNLIhxL2gxM99LWQx49C
	 8CG1MeO321bMQ==
Date: Wed, 28 Apr 2021 12:29:52 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-mm@kvack.org, netdev@vger.kernel.org, linux-arch@vger.kernel.org, 
    linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
In-Reply-To: <YH2hs6EsPTpDAqXc@mit.edu>
Message-ID: <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
References: <YH2hs6EsPTpDAqXc@mit.edu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Apr 2021, Theodore Ts'o wrote:

> This year, the Maintainers and Kernel Summit is currently planned to
> be held in Dublin, Ireland, September 27 -- 29th.  

Hi Ted,

given the fact that OSS is being relocated from Dublin to Washington [1], 
is Kernel Summit following that direction?

[1] https://www.linuxfoundation.org/en/press-release/the-linux-foundation-announces-open-source-summit-embedded-linux-conference-2021-will-move-from-dublin-ireland-to-seattle-washington/

-- 
Jiri Kosina
SUSE Labs


