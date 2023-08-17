Return-Path: <ksummit+bounces-1007-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2077F8AC
	for <lists@lfdr.de>; Thu, 17 Aug 2023 16:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E476A1C21432
	for <lists@lfdr.de>; Thu, 17 Aug 2023 14:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C12014F6C;
	Thu, 17 Aug 2023 14:22:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BECF14F63
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 14:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DE9C433C8;
	Thu, 17 Aug 2023 14:22:05 +0000 (UTC)
Date: Thu, 17 Aug 2023 10:22:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Josef Bacik
 <josef@toxicpanda.com>, ksummit@lists.linux.dev, Jeff Layton
 <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230817102210.0b17f985@gandalf.local.home>
In-Reply-To: <87ttsx98ue.fsf@intel.com>
References: <20230816180808.GB2919664@perftesting>
	<ZN0uNrpD8JUtihQE@bombadil.infradead.org>
	<87ttsx98ue.fsf@intel.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Aug 2023 15:00:57 +0300
Jani Nikula <jani.nikula@intel.com> wrote:

> On Wed, 16 Aug 2023, Luis Chamberlain <mcgrof@kernel.org> wrote:
> > In so far as making it possible to get b) to help, my current excitement
> > surrounds around what Song Liu mentioned to me at LSFMM and then
> > quickly demonstrated that the eBPF folks are doing with patchwork.
> > Get the patches to be tested automatically, and *immediately*
> > patch reviewers and maintainers can get feedback if something is not even
> > worth reviewing.  
> 
> I'm all for automated testing and CI, and all i915 patches get tested
> before merging. But requiring everything to pass before a human so much
> as looks at it can be incredibly demotivating for contributors. For
> example, if they polish the contribution, and take all corner cases into
> consideration to pass the tests... and then get told their design is all
> wrong and needs to be redone from scratch. It's a balance.
>

For big new features, I agree. They shouldn't need to pass all tests. I
think anything that has an [RFC] subject should bypass the test
requirements. But I get a bunch of fixes patches, that fail tests all the
time. If you are sending a fix to something that causes a regression, the
maintainer should not be involved. Automated tests should be enough to tell
the submitter to go back and redo their patch.

-- Steve

