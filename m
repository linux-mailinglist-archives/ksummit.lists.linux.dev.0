Return-Path: <ksummit+bounces-1104-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 430C3798442
	for <lists@lfdr.de>; Fri,  8 Sep 2023 10:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F410E2819EE
	for <lists@lfdr.de>; Fri,  8 Sep 2023 08:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E551FC4;
	Fri,  8 Sep 2023 08:39:57 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE937E9
	for <ksummit@lists.linux.dev>; Fri,  8 Sep 2023 08:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yVA95xW2Ie/ug2jQfFDc5ddfNVZM0aNIhd4I9iNmjSo=; b=Yy/12rCry74UVbjrJyam9lO4L9
	/3xDzBZnBjVcO2a1dg+qggwHeku+bmBsBw7Zo8RIaKDAkzZBAVdKvjlC+J2hyYUuImIMqZjujb0Ae
	NqnVXvCFBQefMufRawRd7XirecFiSioP0nWEWKo8Wh82SfDxULlJ7zsDw8+15KeUUhrUlpsGsizYH
	vl1VBz2Cd+EZGxco8FjIVfrXie4nyBYdC1W4JrqSQfL7TSQWY2+370K+qdzH+JIl7HfUPbX0U2l9+
	F36R5VWn12WhvBEdPEeFJ4cYfEFIgCTXnRPBwkpKpEPlPZDRcKyunuYaD3r14D7oiGCob2GDzXJJQ
	iezPy3Qg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qeX1r-00DKhb-09;
	Fri, 08 Sep 2023 08:39:51 +0000
Date: Fri, 8 Sep 2023 01:39:51 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Dave Chinner <david@fromorbit.com>, Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPrd1yAVdm9Yjw9B@infradead.org>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906215327.18a45c89@gandalf.local.home>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Sep 06, 2023 at 09:53:27PM -0400, Steven Rostedt wrote:
> Anyway, what about just having read-only be the minimum for supporting a
> file system? We can say "sorry, due to no one maintaining this file system,
> we will no longer allow write access." But I'm guessing that just
> supporting reading an old file system is much easier than modifying one
> (wasn't that what we did with NTFS for the longest time?)

read-only is just as annoying, because all our normal test infrastruture
doesn't work for that at all.  So you'd need not only a test harness
for that, but also a lot of publically shared images and/or a tool
to generate filled images.

