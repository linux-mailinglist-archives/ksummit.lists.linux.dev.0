Return-Path: <ksummit+bounces-585-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0F040CC45
	for <lists@lfdr.de>; Wed, 15 Sep 2021 20:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 925003E0FFF
	for <lists@lfdr.de>; Wed, 15 Sep 2021 18:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AC03FFB;
	Wed, 15 Sep 2021 18:03:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1333FF7
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 18:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631729029;
	bh=4c/OxzXQiVl5H5d8rn9uBBYGEsojFyrpOehYLnAZ7uw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=iBoR4GfS4vN1now4PsbnN0S2EqeVQCYWLbmBxQvySteCxB1AkH6NVX+DIjGNCXLv0
	 YIdhDhAm12Y0GM9dO/xBm8XDumnhya6m99PxOeG98fXtX4+NXyH+pT5/HI+2wkIfFA
	 c36guGH7g70bN/IFADMtKCq79xhpyTnckvbRZ8Gs=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 6E4ED128090B;
	Wed, 15 Sep 2021 11:03:49 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zp5bTEmntpo9; Wed, 15 Sep 2021 11:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631729029;
	bh=4c/OxzXQiVl5H5d8rn9uBBYGEsojFyrpOehYLnAZ7uw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=iBoR4GfS4vN1now4PsbnN0S2EqeVQCYWLbmBxQvySteCxB1AkH6NVX+DIjGNCXLv0
	 YIdhDhAm12Y0GM9dO/xBm8XDumnhya6m99PxOeG98fXtX4+NXyH+pT5/HI+2wkIfFA
	 c36guGH7g70bN/IFADMtKCq79xhpyTnckvbRZ8Gs=
Received: from jarvis.lan (c-67-166-170-96.hsd1.va.comcast.net [67.166.170.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 3A41412808F7;
	Wed, 15 Sep 2021 11:03:48 -0700 (PDT)
Message-ID: <f7b70227bac9a684320068b362d28fcade6b65b9.camel@HansenPartnership.com>
Subject: Re: [MAINTAINER SUMMIT] Folios as a potential Kernel/Maintainers
 Summit topic?
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Theodore Ts'o <tytso@mit.edu>, Johannes Weiner <hannes@cmpxchg.org>
Cc: Kent Overstreet <kent.overstreet@gmail.com>, Matthew Wilcox
 <willy@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org,  Andrew Morton <akpm@linux-foundation.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Christoph Hellwig
 <hch@infradead.org>, David Howells <dhowells@redhat.com>, 
 ksummit@lists.linux.dev
Date: Wed, 15 Sep 2021 14:03:46 -0400
In-Reply-To: <YUIwgGzBqX6ZiGgk@mit.edu>
References: <YUIwgGzBqX6ZiGgk@mit.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2021-09-15 at 13:42 -0400, Theodore Ts'o wrote:
[...]
> Would this be helpful?  (Or Linus could pull either the folio or
> pageset branch, and make this proposal obsolete, which would be
> great.  :-)

This is a technical rather than process issue isn't it?  You don't have
enough technical people at the Maintainer summit to help meaningfully. 
The ideal location, of course, was LSF/MM which is now not happening.

However, we did offer the Plumbers BBB infrastructure to willy for a MM
gathering which could be expanded to include this.

James



