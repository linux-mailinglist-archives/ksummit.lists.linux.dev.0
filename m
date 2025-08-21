Return-Path: <ksummit+bounces-2196-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02129B30867
	for <lists@lfdr.de>; Thu, 21 Aug 2025 23:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD7EE1CE77F1
	for <lists@lfdr.de>; Thu, 21 Aug 2025 21:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965E828466C;
	Thu, 21 Aug 2025 21:32:10 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850442874F9
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 21:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755811930; cv=none; b=kk2GwSoO3SAyNbjxA+adyCrYp/ZdObj0wBoIQkAMsib7DlkNoFOs9y5ZOjv+D4u3U3owcWARG2z+C9aS3JGgqfXYg1To4Lb4EimtWP+40SU9dRRgpUOyKqRr87b+r3gnA2oIoT6cxN8NYuK9ami0w5fCvy/YhZ4uHNB3nOVTvvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755811930; c=relaxed/simple;
	bh=P0p77+8obI967RjoOJV905Nf07c/q8cYGXDyggrX7dc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iCer8VDIhpfYt9RC945yQdc+z7fbLDAQqZ/9MFIwtkYKGxCMv8/8/ZB+irDqzjTXj8K6YUC738GLufPq4CIPHppxvDWKrqsuwY0UVYDRzuxtNCjUuTEhLgC2hghxBX/K/1HEo0U8pWZFpdylnd78rRmVnMUtP7zz490m7tXYfqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 00A5414053B;
	Thu, 21 Aug 2025 21:32:04 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id 18E8A2002C;
	Thu, 21 Aug 2025 21:32:03 +0000 (UTC)
Date: Thu, 21 Aug 2025 17:32:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, "Luck, Tony"
 <tony.luck@intel.com>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jkosina@suse.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250821173207.0be7c530@gandalf.local.home>
In-Reply-To: <7c199d68-cf81-4507-b66d-d743bda34c81@paulmck-laptop>
References: <9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
	<20250818230729.106a8c48@foz.lan>
	<9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
	<4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>
	<d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
	<20250821122329.03c77178@foz.lan>
	<20250821125037.5cf5be3d@gandalf.local.home>
	<20250821193041.398ed30b@foz.lan>
	<DS7PR11MB60772F52AF3A152B5AB04A1CFC32A@DS7PR11MB6077.namprd11.prod.outlook.com>
	<20250821200159.1bcdf0c9@foz.lan>
	<7c199d68-cf81-4507-b66d-d743bda34c81@paulmck-laptop>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 18E8A2002C
X-Stat-Signature: gh47k87rup666j6zp7dtueetm1xsn7ed
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/kOWxHHJZ0UlJDCMfJOXpmu1DZsag+Cqc=
X-HE-Tag: 1755811923-728833
X-HE-Meta: U2FsdGVkX18KxOiAk/eMcMoWzK/rS4uE10m3YztUcm/RgVwS1XheZ00ajZurMJ0gZw5xkG+gp1ykJLEk+/49AAkVgDAvwNEb60enZt/CtAhPJCQeRHR/VhMjKjJStCIrM6tYVc5UbGFS0DwBbCaXscYqLHv/uW+pUyekFzBwl3e3PBjWsqI8YFb3nzbB0SDf7ukcymZE32OCw5a0VBJ/tp3WSByAfk1HZXwd4Wa8kqIg58X10r+336aVhuYNhMyC7Rn1VEW/uYdyDMOpHjfaUsNmX3Idv5YS9EAkCGXD7kecjbLmF80eUFWcOvqM8aAfpWEdIxY9MvcW5lcgCx2MB+HgRdnGoKMz

On Thu, 21 Aug 2025 14:21:13 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> > Yet, as I saw a lot more the "Hello world", I haven't using the
> > brown fox pattern for years.  
> 
> "Sphynx of black quartz: Judge my vow!"

I had to ask Gemini: "Make up a sentence with every English letter in it",
and it gave me:

   Since "the quick brown fox jumps over the lazy dog" and "pack my box with
   five dozen liquor jugs" are already well-known, here are a couple of
   different sentences that contain every letter of the alphabet:

   "Jinxed wizards pluck ivy from the big quivering sphinx."

   "Sympathizing would vex a quick jab from the crazy fox."

:-p

-- Steve

