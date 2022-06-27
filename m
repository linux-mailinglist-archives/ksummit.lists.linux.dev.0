Return-Path: <ksummit+bounces-728-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D47A55BABC
	for <lists@lfdr.de>; Mon, 27 Jun 2022 17:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id A47FA2E0CAA
	for <lists@lfdr.de>; Mon, 27 Jun 2022 15:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDD733F0;
	Mon, 27 Jun 2022 15:31:49 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABB63235
	for <ksummit@lists.linux.dev>; Mon, 27 Jun 2022 15:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o+wvIY3b96QCvedSswyiKOPsqy8xmEz85vbRSlwEOdM=; b=2usEtCTZqcxI25GfouCIw+qiSc
	sMYmTC82oYciFB4W4xyWvK3duYDE88q6q1wNOg+sKnwDasvxE3lBgptTWdKlYYG2fdQYBW9HY4pUe
	GJlSt9lBRYSK/VnQS1AmVQILPI9vgUOA5WG6fUFUqTLCLoQ8FEyEoG8hPhrTLlfBg2sdNqpcgycPD
	TX4ejakIBWl+4FqGENLy8VqKifiybWVtjryDfzyCGs0OAPxV0hmJamDy8a9ZdWduTwyYjtKaIzQyE
	g9XQWBFGkmFRgV8C6y6ZXpfaKysR0ifPjaXeQRVpQHN1x9C2KPZorldr3zXTCIdSTxr8ef28x3d1T
	MSLarnnw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5qi9-001eeN-FR; Mon, 27 Jun 2022 15:31:37 +0000
Date: Mon, 27 Jun 2022 08:31:37 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Markus Heiser <markus.heiser@darmarit.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>,
	ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
Message-ID: <YrnNWXOdACBbdoiF@infradead.org>
References: <87sfo3nh3t.fsf@meer.lwn.net>
 <20220618092447.5ebed314@sal.lan>
 <875ykrrb45.fsf@intel.com>
 <20220623105747.079ac92b@sal.lan>
 <87a6a38plu.fsf@meer.lwn.net>
 <20220624083307.159824bd@sal.lan>
 <963dd061-47ba-6f96-72e2-4f34cc952b8c@darmarit.de>
 <87fsjqyvlx.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsjqyvlx.fsf@meer.lwn.net>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Jun 27, 2022 at 09:27:54AM -0600, Jonathan Corbet wrote:
> The real question, perhaps, is whether requiring people to set up a
> virtualenv to run a supported version would be too much.  It's something
> I worry about.

I know for on that I will not setup pything venvs as they are massive
pain.  Anyting that isn't available in a somewhat recent distro using
the package manage is a complete no-go.  And software that changes so
frequently that this question even arises seem rather suspect to me
in general for something like documentation that should have a wide
range of contributors.

