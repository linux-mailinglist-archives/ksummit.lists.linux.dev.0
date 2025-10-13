Return-Path: <ksummit+bounces-2501-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2548ABD5870
	for <lists@lfdr.de>; Mon, 13 Oct 2025 19:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C07EC4E5679
	for <lists@lfdr.de>; Mon, 13 Oct 2025 17:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A66308F0D;
	Mon, 13 Oct 2025 17:36:40 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B83E3043C1
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760377000; cv=none; b=Q1rtHUTmyv+mk6WteOsXz8mD9X4nJp+uem19I1AinAWYYQuPL3RDS8zT/Vz3vDIl6f2G+TECGwX0u7oUNT+B4FsuabU9ztcUlD3ebIZc39CZdjAq+QB4u2uUcC7iqBet5i9sbM42MPI0R6mdt610L5OjiQjxfaF1XZiy1axyxkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760377000; c=relaxed/simple;
	bh=/UofpfoXuwVoei1oBARYxDgiKrJetRQ8aUj5eZjEFN8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mTwWs+XYTMfMmQCBxs8PRKa9LGfTulEvWbnD9b8BYIg706mBQUIQDoVJZf5rasN6frmSGf5xs/Nvsw+GZEWLQ1vP/UiNMTSxRDUOWV0f+urbqcxX8rhhbA5DWSXbtJNTO/CbEwIlufluXuK4zw9WHp1nehV8L0rgOvBVtRtLWl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 24692140587;
	Mon, 13 Oct 2025 17:36:36 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 870802000D;
	Mon, 13 Oct 2025 17:36:34 +0000 (UTC)
Date: Mon, 13 Oct 2025 13:36:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <20251013133637.040132f1@gandalf.local.home>
In-Reply-To: <6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
	<6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: i9ihky1ix9hxdga3qf1rg8c5gshqwbqm
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 870802000D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+/7DBNlGyiFmf+Quus/kTeHoNt9HpV5N8=
X-HE-Tag: 1760376994-788945
X-HE-Meta: U2FsdGVkX18zrslD65MuF8PArEo6lPkFa3Q5SXGLB+zWLKGR9pM/URWp+mj5zUcaDUMZpANbbyWF6No7iP6VFVAyZwcqgKG8vwzA4XkaLTO1xBIek3C6t1SzkmSCdJmLBW158aKoaoQewdasLGBKNu4W5rfNnybX5UdkZ+uVvXB3D1P6oDACwTrNGT7fQnOrdPT5/mdtMd49VFpaDnxiWjOCLGoHlE5PLT/tgWZ12CoiZIfER1aYkkdEcId2MNrLTHzIfTsVC0rHSHPfbbeIWieuG0UgHhpWAyeroGT+fp29veIJR2wv2cDaVkFFJRP5lVcC//8jNQqzZaOhveqgHw01VKY9Ccts28sI7iXtZrjLlsoG88hdQY4o1Hu2wa5q6fDoAp48lgHFOPA1Q8U7gg==

On Mon, 13 Oct 2025 08:25:01 -0400
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:

> AFAIU. this use of Link trailer is used as a strategy to work around
> the lack of unique identifier in patch commit messages that identifies
> multiple revisions of a patch, for tracking by patch review tooling
> and facilitate digging through patch history.

That's not how I use it at all. Copying my reply from the tooling thread
here:

  [..]

So it allows you to not only find the cover letter of a series, but also
daisy chains all the links to previous versions so you can see how the
patch was developed, and all the comments to the older versions.

Now my workflow incorporates these link tags. When I need to create a new
version of the patch, I save the old git branch with its version:

  git branch topic-v1
  git reset --hard <base-commit>

Then I download the old version from patchwork, run my scripts to pull it
in (which adds the links to the emails of those commits). And when I make the
next version, I record the changes by replacing the:

  Link: https://lore.kernel.org/...

With

  Changes since v1: https://lore.kernel.org/...

And before sending my emails, I move that text below the '---'.

And this makes it very easy to incorporate the daisy chain. If I have to
use any external tooling to search for it, I'm not going to bother, and
this workflow will just stop happening.

-- Steve

