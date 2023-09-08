Return-Path: <ksummit+bounces-1105-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1753798459
	for <lists@lfdr.de>; Fri,  8 Sep 2023 10:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78D1928138A
	for <lists@lfdr.de>; Fri,  8 Sep 2023 08:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965AC1FC4;
	Fri,  8 Sep 2023 08:45:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346271849
	for <ksummit@lists.linux.dev>; Fri,  8 Sep 2023 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KWd4KSw99oCNryENUOdeFCqyw64DVwBYPBIbYise178=; b=HEVKJjMHl106gHpddbpxmBWjMk
	BnztUPqepZ8iBIRg7rPF8oYQE8BanQXU7KH+Z4TDBeK1J96mQlAG/H3HN0MA2Br6xUDXV+JbErWVL
	hUb93RvEWdHXaOPM3JsMdQ3NFBu8DthH59/ZEBHaPCV352l2RZFJxSjf3pK94hiQKr5PPN7y9rL0x
	WvTPOfayQEJ74AngGTV8MzMLus66Af9tkHyinuufdhSZFPD0Ei+UDgVP8CMYT9oPQ1M+tbTucRVdj
	mcHFSLWoS8UolqauSMqJjBYVG+x31n0QtJ+DhD343bP6T/Ofzx1r0FMW4PB/A+cB2LLduiuQ54G0B
	qzRAN0UQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qeX6o-00DLJB-2H;
	Fri, 08 Sep 2023 08:44:58 +0000
Date: Fri, 8 Sep 2023 01:44:58 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Christian Brauner <brauner@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Dave Chinner <david@fromorbit.com>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPrfCvorp9XIUPYY@infradead.org>
References: <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area>
 <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlC0pf2XA1ZGr6j@casper.infradead.org>
 <c89ebbb2-1249-49f3-b80f-0b08711bc29b@leemhuis.info>
 <20230907-kauern-kopfkissen-d8147fb40469@brauner>
 <d62225ae-73dc-4b45-a1d9-078137224eb5@leemhuis.info>
 <0ece94aa-141e-564c-f43c-2d6d4b9e61c4@roeck-us.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ece94aa-141e-564c-f43c-2d6d4b9e61c4@roeck-us.net>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Sep 07, 2023 at 05:57:47AM -0700, Guenter Roeck wrote:
> $ sudo apt-get install hfsprogs

Oh, looks like ohn Paul Adrian Glaubitz actually resurrected it after
a 7 year hiatus when it was dropped entirely.  That's good news to at
least keep hfsplus on life support.


