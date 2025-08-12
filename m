Return-Path: <ksummit+bounces-2127-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65624B229B5
	for <lists@lfdr.de>; Tue, 12 Aug 2025 16:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BB06424D84
	for <lists@lfdr.de>; Tue, 12 Aug 2025 13:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CACC28688F;
	Tue, 12 Aug 2025 13:52:28 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221A82853ED
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 13:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755006747; cv=none; b=k40xuN2zxI6N/N+bkYeYhqfI3WiJD1KQhICZ1FbdS3gmaLNdTvqB9lSftcwoZGMmZ4axPwaeym5CqPOgJ7/+hDpNc3AuWqj3yHwg8/UMOKhAEFgh3SQXV1ApgAOcpJXDQPlxa16TXNn6lmScxzQWNsu6tPUQnOd5UNv8Muc/eQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755006747; c=relaxed/simple;
	bh=t8vyIBVxqGVyQNF4dJq6Wt/ynH217qduX5sqHm1VMa4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtYwQsgd5D/7wV9XcOMHsMAnTzZyuXFNnkK1wLKMyXF0gu1rpdewGGdCpcaEni4qonpMUt4w8zRhimWNPfeeSDFIjPftidVd0+epUR45AkSckMf2dcyXyckNb9zLOZHFf7VypQn3pIgERN4YxxyXoOUCMp5lEb3VFa2TlgrFxGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id BF5F61DC2BC;
	Tue, 12 Aug 2025 13:43:22 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 374CD33;
	Tue, 12 Aug 2025 13:43:21 +0000 (UTC)
Date: Tue, 12 Aug 2025 09:44:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <20250812094406.22cbd599@gandalf.local.home>
In-Reply-To: <c88ce921-2c56-43c8-9bdb-01fd4be19ca5@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
	<56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
	<c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
	<c88ce921-2c56-43c8-9bdb-01fd4be19ca5@lucifer.local>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 374CD33
X-Stat-Signature: 73hwyc97yg4wqka4znwoa144xae89mwu
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18ZwU7tCLjVaMRWF79vlBTe/koE2jfc8Zk=
X-HE-Tag: 1755006201-960684
X-HE-Meta: U2FsdGVkX18Tu5QZJccBKdUcXL000CmmakBADvEP2SrkRghA+r+sohthiHO0cn7a3lTNsd4+682RXpyaDhTdPJYCcIR32Tio+/kabqTfda/dEemP1tc0c/bwnN3QP14kPmdawmAfj59BfR1dP1wIn3Ypev52lFpYQIaJ3ReC7NKROlnKRz4XN3EL6fKb/cxH9tyX9kk5G7RQeNO8pGAThjTOu46Mo2aZIUFSnzP76ze0TR7Eu0SNqTCujmNRjR32VVPdm6ZqQhhCY0V0hSn6T1IhH02cqImEe30TJEMIARUjqnhldNA2kYUPp/kA7opU22PRx8owr9qybNd/zPWNvzixryUDx77ylmN8i67owkQDV7kIH/7xxnFPvVqK6ILownX3B/Lyjn3BVwInMPVITg==

On Tue, 5 Aug 2025 19:23:47 +0100
Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> +cc Steven
> 
> Apologies, I meant to +cc you here as I mention an issue you encountered,
> and forgot of course :>)

Just got back from PTO and now catching up through my massive heap of emails.

No worries, I'm subscribed to the ksummit list and already read your email
before I even saw this.

-- Steve

