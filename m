Return-Path: <ksummit+bounces-2076-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E085B1BB86
	for <lists@lfdr.de>; Tue,  5 Aug 2025 22:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1AE63BEE9D
	for <lists@lfdr.de>; Tue,  5 Aug 2025 20:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CB41EEA5D;
	Tue,  5 Aug 2025 20:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="NyuiBxxt"
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F1B78F2F
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 20:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754426944; cv=none; b=OxTfTxr94Tx2Xxh6AJRCsaA7D81le6zCyzXL/N0uakcFBK21MPyBQ1/YX9Avj492835gWt7f5fwemetUKljbgtCue/sB0fiE3Q/tC+WK9SZXcpc71FiMCWlaUcLSnu7Y5m3dfOkqbtGoiWA+g8aMNFXg09tBkhHQhjmVX7BBhtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754426944; c=relaxed/simple;
	bh=T/4uxLHm13smQOgonzXsbfiTXu8ETSo11pkGraczBpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qouqnt7eKb3cdtqHQJ5MwtY9d2EG+2P7fBtt+9pGA9m/NNp9Fp2SD0gL5qBoTLkU2IDp88wzVFNJQpZDRIquAsZ2IbuQbFzfT1I/zaHrmD7E769wxFXc2eYA8TJfEKyXJnOgMblyfnYj06J5y1kJU5weHi/7YVz8hLgNff+adJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=NyuiBxxt; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zML5wbG2LFhdc7rTmRHvCKhEbdY+LNQRt89Dx3jrg+I=; b=NyuiBxxtxsn5W5jZCMyhOn2eFx
	kJmtCvaSGAQck+dWyrE07qXA3fPRT1lKfF5MlmqFjmgn1VkpnjXd9YWzmlHwSBdqaeLiFH8VqZecl
	hgdl16n4TIm69q37wtg7LOR6tBhjWnLP/c5Wt+9b+AKQEhknPkrYQwgsRhBrHFvStznqZK4WBouhX
	I7/2QBX9Sqc/BSczLFoY7XXU6FpKQuI/7xvA4QcD5LxqYYzgvKr7eDvnZHIopQFm7etUKi9r+Lh60
	mpyB6id9yW7zohPdtdoR0+xrLeMM6NB9429thLgwegHNf/nPk8g70jwE39JOVmAmw3Mn0mUqMJIjs
	bonqlMcA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujOag-00000005n3T-0ye3;
	Tue, 05 Aug 2025 20:48:58 +0000
Date: Tue, 5 Aug 2025 21:48:58 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <20250805204858.GD222315@ZenIV>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
 <aJJP2BM658FYJdJv@lappy>
 <1ced158f-b433-46ef-a70f-d035ec413a12@lucifer.local>
 <72ee0f61379054e327d502bbe77aae3d76966d17.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ee0f61379054e327d502bbe77aae3d76966d17.camel@HansenPartnership.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Aug 05, 2025 at 04:02:02PM -0400, James Bottomley wrote:

> > My objections are to do with the the kinds of errors one can
> > encounter with statistical inference like this.
> > 
> > Humans do not confidently hallucinate in the absence of concrete
> > data, rather we infer and model.
> 
> Might I refer you to pretty much any white house press briefing for
> counter examples ...

	Thank you.  Do we really want their kind anywhere near the
codebase, though?  How would you treat someone ever caught pulling that
kind of shit?  Personally I'd classify them as indistinguishable from
scammers and that would be it, reducing the problem to recognizing their
sock puppets if they ever get such.

