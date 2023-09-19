Return-Path: <ksummit+bounces-1169-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EA37A6DDB
	for <lists@lfdr.de>; Wed, 20 Sep 2023 00:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A40072816E9
	for <lists@lfdr.de>; Tue, 19 Sep 2023 22:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9963AC1F;
	Tue, 19 Sep 2023 22:02:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7E337144
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 22:02:16 +0000 (UTC)
Received: from letrec.thunk.org (c-73-8-226-230.hsd1.il.comcast.net [73.8.226.230])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 38JM1tm2015299
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 18:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1695160917; bh=VlSVJ9vhOWpF++0wJ/7PlY/owKuFZKFQTbDtn73j9fA=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=oiiskmTYwgasxDnLuwnAEBSM6PWQtEaA+37QXfU/Zj+hm0ePsrSWZnmKoqj+NonsF
	 ZzBnlFDlU9BfFF+6HVTffFEIgFq0aZCb7TX1X8XzoNpcacGLBUST82XstCrYGqPsjh
	 21bnuhy3vsfRvwPIjFjdNbeY6mir9uFrBmfjvbkKMaIbGfx0Z2O18do1KawP59NtOH
	 vDH5ihqNKpIQqd7/vsl13l4qnWT49rpp7HamMKA4kq4srEQ5ARfV4VHiTRuBCLxGfh
	 nyhTblhiIOCHDGiTa0ooIytJMgsWs+TUY7LaF1w9Az3xMwP1iM5lKIPkaQfjagu0tu
	 bf8wcBS7TcQTQ==
Received: by letrec.thunk.org (Postfix, from userid 15806)
	id 689BC8C0385; Tue, 19 Sep 2023 18:01:55 -0400 (EDT)
Date: Tue, 19 Sep 2023 18:01:55 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Shuah <shuah@kernel.org>
Cc: tech-board-discuss@lists.linux-foundation.org, ksummit@lists.linux.dev
Subject: Re: [Tech-board-discuss] [MAINTAINERS SUMMIT] Maintainers Support
 Group
Message-ID: <ZQoaUy34siNzH1ir@mit.edu>
References: <20230919121001.7bc610d4@gandalf.local.home>
 <371cb5d1-9997-a03b-4848-550ac8658021@kernel.org>
 <ZQoG71Vdy9iLAcY1@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQoG71Vdy9iLAcY1@mit.edu>

On Tue, Sep 19, 2023 at 04:39:11PM -0400, Theodore Ts'o wrote:
> On Tue, Sep 19, 2023 at 10:52:40AM -0600, Shuah wrote:
> > As a member of the CoC, I respectfully disagree with the statement "but all the
> > focus has mainly been around telling maintainers how to behave." This impression
> > might have been the result of one unfortunate incident that took place last year.
> > is only part of what CoC has been doing.
> > 
> > A majority of reports are related to incorrect understanding of how the community
> > works and discusses technical issues. Most of them get resolved without involving
> > the community. This is behind the scenes silent work CoC does.
> > 
> > It is unfortunate that CoC is being viewed as a body that is focused on telling
> > maintainers how to behave. I would encourage to not view CoC work based on one
> > or two cases that were outliers. CoC worked very hard to resolve them fairly and
> > that benefited the community as a whole.
> 
> Shuah, I don't think this is the fault of the CoC.  Much of it is in
> how people interpret the CoC, or think it should be adapted.

I just realized that this statement was a bit ambiguous; in the first
CoC, I meant the "Code of Conduct Committee".  In the second CoC in
this sentence, I made the "Code of Conduct".

From the context of what you wrote, I *think* you were consistently
referring to the Code of Conduct Committee, but when I see CoC I tend
think the actual "Code of Conduct" and not the committee which
enforces the CoC.

Apologies for any confusion,

						- Ted

