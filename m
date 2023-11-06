Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A556C7E2A96
	for <lists@lfdr.de>; Mon,  6 Nov 2023 18:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3106A1F21C0D
	for <lists@lfdr.de>; Mon,  6 Nov 2023 17:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E1C29CE8;
	Mon,  6 Nov 2023 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JcwOEcAM"
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A4015AF2;
	Mon,  6 Nov 2023 17:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xLvzAB2KqsXWK/bbI9xwkoQUFfUR6fNp0TU22xjrqRk=; b=JcwOEcAMHmgVhZlrJBdDumFqrS
	U0j1GJBXtM0u63T85zW6QdmzbBqN2Y83nL0GexodIXCgzcAt7gcGRfwL/RvhfvjyCdJcDxHlASdEv
	7h512YLUOFGP/JomoI207Y5cE6fW7HvH2S9YuK+JiRLebxMGnRYrC+oocdNoLXYebt1CJ6TxhDIrj
	9Ayxt9F9HzaEtbkJRvuqA0JC1sesZ5H/6OyHi2buaD5gvrVc0tsrgrGKbDEURPMx1aXrOuts1/Hto
	LPBA4xwZtKoFMW7yP3rxd3nJeqIGascVdmHjfc7jBvd/cOd1JaTN63hMtY7im9Z4Qd6oAqSBzeZjH
	zbq+mxQg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r032G-00HBhA-30;
	Mon, 06 Nov 2023 17:05:12 +0000
Date: Mon, 6 Nov 2023 09:05:12 -0800
From: Christoph Hellwig <hch@infradead.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <ZUkcyCb5DEVEDkKj@infradead.org>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <87r0l2yi7v.fsf@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0l2yi7v.fsf@email.froward.int.ebiederm.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Nov 06, 2023 at 10:11:48AM -0600, Eric W. Biederman wrote:
> > - due to the sheer volume of messages, LKML is generally seen as useless for
> >   holding any actual discussions
> 
> I have never had that impression of LKML.

Same here, I am actually reading through lkml, although superficially
skipping over some bits, and definitively starting discussions there.

Restricting access to the new lkml is not acceptable.  How about
restricting access to all lists for gmail addresses if gmail is so
broken?


