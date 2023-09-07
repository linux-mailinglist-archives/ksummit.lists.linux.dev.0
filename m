Return-Path: <ksummit+bounces-1087-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5A0796F43
	for <lists@lfdr.de>; Thu,  7 Sep 2023 05:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F14A2813C9
	for <lists@lfdr.de>; Thu,  7 Sep 2023 03:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB754EC6;
	Thu,  7 Sep 2023 03:26:27 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D62AA5A
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 03:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=beztTAELL/ljqjPMu+PY2abJDnM0F7oBhZ4gTPpwmck=; b=qI/nl4JrJBHZcsrO8WTOQI8uas
	PprWSqS+YNPmWs2I1Wsag0kZGx2BExpPA2k9SHXQvGwsi1CGn46HuHs98a4jiFMCXxrOmbbnZNxio
	MjqbxzYb2SbUIY8ZWJZ3BToWIsVLPR6b13FERlR0G3qUTalDP+zgYsHcaWzPxbbh/uU8+UpsF/8wG
	CcmD5LvB9YfG9p9cLXwJhkv5rdtn5Dz8kW5KljCq/adCrkXxcsOd5y2D3FzgfL5upUge9/JhPXOGj
	ZSFFxRwRbVuyDVAKP5PZwlmYp4ljROuXRyF4znWwSfV3cB0hqwF0pbcKPeOcqiowiizMaFVMxXNp6
	HVyVRpJA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qe5ek-007pei-Uj; Thu, 07 Sep 2023 03:26:11 +0000
Date: Thu, 7 Sep 2023 04:26:10 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Dave Chinner <david@fromorbit.com>, Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPlC0pf2XA1ZGr6j@casper.infradead.org>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area>
 <20230906225139.6ffe953c@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906225139.6ffe953c@gandalf.local.home>

On Wed, Sep 06, 2023 at 10:51:39PM -0400, Steven Rostedt wrote:
> I guess the point I'm making is, what's the burden in keeping it around in
> the read-only state? It shouldn't require any updates for new features,
> which is the complaint I believe Willy was having.

Old filesystems depend on old core functionality like bufferheads.

We want to remove bufferheads.

Who has the responsibility for updating those old filesystmes to use
iomap instead of bufferheads?

Who has the responsibility for testing those filesystems still work
after the update?

Who has the responsibility for looking at a syzbot bug report that comes
in twelve months after the conversion is done and deciding whether the
conversion was the problem, or whether it's some other patch that
happened before or after?


